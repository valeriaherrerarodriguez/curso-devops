from flask import Flask

app = Flask(__name__)


@app.route("/")
def home():
    return """
    <html>
        <head>
            <title>TicoMarket</title>
        </head>
        <body>
            <h1>🇨🇷 Bienvenido a TicoMarket</h1>
            <p>Aplicación desplegada con Docker + Terraform + Ansible + AWS.</p>
        </body>
    </html>
    """


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)