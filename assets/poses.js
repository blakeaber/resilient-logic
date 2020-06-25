
const defaultFrameRate = 5;
const defaultFrameCacheSize = 10;
const minPoseConfidence = 0.1;

const defaultInputVideoId = 'demo-video';
const defaultOutputCanvasId = 'demo-output';
const defaultPoseStorageId = 'cachePoses';

const defaultAlgorithm = 'single-pose'
const defaultArchitecture = 'MobileNetV1'

const defaultQuantBytes = 4;
const defaultMobileNetMultiplier = 0.75;
const defaultMobileNetStride = 16;
const defaultMobileNetInputResolution = 300;


function drawPoint(ctx, y, x, r, color) {
  ctx.beginPath();
  ctx.arc(x, y, r, 0, 2 * Math.PI);
  ctx.fillStyle = color;
  ctx.fill();
}


function drawSegment([ay, ax], [by, bx], color, scale, ctx) {
  ctx.beginPath();
  ctx.moveTo(ax * scale, ay * scale);
  ctx.lineTo(bx * scale, by * scale);
  ctx.lineWidth = 2;
  ctx.strokeStyle = color;
  ctx.stroke();
}


function drawSkeleton(keypoints, minConfidence, ctx, scale = 1) {
  const adjacentKeyPoints =
      posenet.getAdjacentKeyPoints(keypoints, minConfidence);

  function toTuple({y, x}) {
    return [y, x];
  }

  adjacentKeyPoints.forEach((keypoints) => {
    drawSegment(
        toTuple(keypoints[0].position), toTuple(keypoints[1].position), 'aqua',
        scale, ctx);
  });
}


function drawKeypoints(keypoints, minConfidence, ctx, scale = 1) {
  for (let i = 0; i < keypoints.length; i++) {
    const keypoint = keypoints[i];

    if (keypoint.score < minConfidence) {
      continue;
    }

    const {y, x} = keypoint.position;
    drawPoint(ctx, y * scale, x * scale, 3, 'red');
  }
}


function detectPoseInFrame(video, posemodel) {

  const canvas = document.getElementById(defaultOutputCanvasId);
  const ctx = canvas.getContext('2d');
  const flipPoseHorizontal = true;
  
  canvas.width = video.width;
  canvas.height = video.height;

  sessionStorage.setItem(defaultPoseStorageId, JSON.stringify([]));
  async function poseDetectionFrame() {

	function addLatestPose(x) {
      let cachePoses = JSON.parse(sessionStorage.getItem(defaultPoseStorageId));
      cachePoses.push(x);

      let latestCachePoses = cachePoses.slice(-defaultFrameCacheSize);
      sessionStorage.setItem(defaultPoseStorageId, JSON.stringify(latestCachePoses));
  	}

	const pose = await posemodel.estimateSinglePose(video, {
      flipHorizontal: true
	});

    ctx.clearRect(0, 0, canvas.width, canvas.height);

    ctx.save();
    ctx.scale(-1, 1);
    ctx.translate(-canvas.width, 0);
    ctx.drawImage(video, 0, 0, canvas.width, canvas.height);
    ctx.restore();

    let poses = [pose]
    poses.forEach(({score, keypoints}) => {
      if (score >= minPoseConfidence) {
        drawKeypoints(keypoints, minPoseConfidence, ctx);
        drawSkeleton(keypoints, minPoseConfidence, ctx);
      }
    });

    setTimeout(function() {
      requestAnimationFrame(poseDetectionFrame)
      addLatestPose(pose)
    }, 1000 / defaultFrameRate);

  }
  	
  poseDetectionFrame();

}


function startPoseEstimation(n_clicks) {

	async function bindPage() {
		const net = await posenet.load({
			architecture: defaultArchitecture,
			outputStride: defaultMobileNetStride,
			inputResolution: defaultMobileNetInputResolution,
			multiplier: defaultMobileNetMultiplier,
			quantBytes: defaultQuantBytes
		});

		let video = document.getElementById(defaultInputVideoId);
		video.addEventListener('loadeddata', detectPoseInFrame(video, net));
	}

    if (n_clicks > 0) {
		console.log('Start Pose Estimation!')

		let video = document.getElementById(defaultInputVideoId);

		document.getElementById('demo-start-recording').disabled = true;

		navigator.mediaDevices.getUserMedia({
			audio: true, 
			video: true
		}).then(function(stream) {
			setSrcObject(stream, video);
			console.log('Video Streaming!')
			video.play();
			video.muted = true;
			document.getElementById('demo-stop-recording').disabled = false;
		}).catch(function(error) {
			console.error("Cannot access media devices: ", error);
		});

		bindPage();

	}

}


function stopPoseEstimation(n_clicks) {
    if (n_clicks > 0) {
		console.log('Stop Pose Estimation!')

		let video = document.getElementById(defaultInputVideoId);
		const stream = video.srcObject;
		const tracks = stream.getTracks();
		tracks.forEach(track => track.stop())

		console.log('Stop Video!')

		video.removeEventListener('loadeddata', detectPoseInFrame);

		document.getElementById('demo-stop-recording').disabled = true;
		document.getElementById('demo-start-recording').disabled = false;
	}
}


window.dash_clientside = Object.assign({}, window.dash_clientside, {
    posenet: {
		start_estimating_poses: startPoseEstimation,
		stop_estimating_poses: stopPoseEstimation
    }
});
