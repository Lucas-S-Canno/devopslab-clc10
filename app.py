from flask import Flask

app = Flask(__name__)

@app.route("/")
def pagina_inicial():
    return "Desenvolvido por Lucas Sachini Canno - Turma: CLC-10"