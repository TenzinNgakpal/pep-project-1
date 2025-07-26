import pytest
from app import app

@pytest.fixture
def client():
    """
    Configures the Flask app for testing.
    Sets test mode and provides a test client.
    """
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_hello_world(client):
    """
    Tests the / route of the Flask application.
    Checks if the response status code is 200 OK and the content is as expected.
    """
    response = client.get('/')
    assert response.status_code == 200
    assert b'Hello, World! This is a Flask app deployed with DevOps!' in response.data
