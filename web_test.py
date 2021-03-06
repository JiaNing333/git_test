from flask_sqlalchemy import SQLAlchemy
from flask import Flask


db = SQLAlchemy()

app = Flask(__name__)

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = "mysql+pymysql://webTest:123456@127.0.0.1:3306/cafe_features"

db.init_app(app)

@app.route('/')
def index():

    sql_cmd = """
        select *
        from cafe_features_500m_CSV 
        """

    query_data = db.engine.execute(sql_cmd)
    print(query_data)
    return 'ok'


if __name__ == "__main__":
    app.run()