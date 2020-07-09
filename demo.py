
import dash
import dash_daq as daq
import dash_bootstrap_components as dbc
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output, State, ClientsideFunction


# external JavaScript files
external_scripts = [
	'https://cdn.jsdelivr.net/npm/@tensorflow/tfjs',
	'https://cdn.jsdelivr.net/npm/@tensorflow-models/posenet',
	'https://www.WebRTC-Experiment.com/RecordRTC.js',
]

app = dash.Dash(
	__name__, 
	external_scripts=external_scripts,
    external_stylesheets=[
        dbc.themes.LUX
    ],
	meta_tags=[{
	  'name': 'viewport',
	  'content': 'width=device-width, initial-scale=1.0'
	}]
)
app.title = 'Pose Estimation Demo'


app.layout = html.Div([
    html.Div(id='start-target'),
    html.Div(id='stop-target'),
    dbc.Button("Start Recording", id="demo-start-recording"),
    dbc.Button("Stop Recording", id="demo-stop-recording"),
    html.Video(id='demo-video', width=600, height=500, autoPlay=True, controls=False),
    html.Canvas(id='demo-output'),
    html.Div(id='poses', style={'display': 'block'}),
    dcc.Interval(
		id='interval',
		interval=2000
	)
])


app.clientside_callback(
	"""
	function () {
		return sessionStorage.getItem('cachePoses');
	}
	""",
	Output('poses', 'children'),
	[Input('interval', 'n_intervals')]
)


app.clientside_callback(
    ClientsideFunction(
        namespace='posenet',
        function_name='start_estimating_poses'
    ),
    Output('start-target', 'children'),
    [Input('demo-start-recording', 'n_clicks')]
)


app.clientside_callback(
    ClientsideFunction(
        namespace='posenet',
        function_name='stop_estimating_poses'
    ),
    Output('stop-target', 'children'),
    [Input('demo-stop-recording', 'n_clicks')]
)


if __name__ == '__main__':
	app.run_server(host='127.0.0.1', debug=True)
