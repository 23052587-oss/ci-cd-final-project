from flask import Flask
from flask_talisman import Talisman

app = Flask(__name__)

# Basic strict CSP policy structure for security headers
csp = {
    'default-src': '\'self\'',
    'object-src': '\'none\''
}

# Initializing Talisman with secure header options
talisman = Talisman(
    app,
    content_security_policy=csp,
    force_https=True,
    strict_transport_security=True,
    session_cookie_secure=True
)

from service import routes
