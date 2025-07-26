from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    """
    This function handles requests to the root URL.
    It returns a simple greeting message.
    """
    return 'Hello, World! This is a Flask app deployed with DevOps!'
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)