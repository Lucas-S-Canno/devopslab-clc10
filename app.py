from flask import Flask

app = Flask(__name__)

@app.route("/")
def pagina_inicial():
    return "Teste de falha no pipeline"