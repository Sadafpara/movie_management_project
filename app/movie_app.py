import json 

from flask import Flask, render_template
from flask_mysqldb import MySQL

#Defining the rout path.
app = Flask("MovieApp")
app.config ["MYSQL_HOST"] = "127.0.0.1"
app.config ["MYSQL_USER"] = "root"
app.config ["MYSQL_PASSWORD"] = "2790"
app.config ["MYSQL_DB"] = "movie_db"  


mysql = MySQL(app) #ddefining the class of mysql

@app.route("/") # decorator, changes the behavior of the functions
def hello_world():
    return "<p>Hello World!</p>"  # we could either use a plain text or html elements as it's going to be html page

@app.route("/movies/") #we want it to be on a different route
def list_movies():
    cursor = mysql.connection.cursor() #to work with sql we are defining a cursor 
    query_string = "SELECT * FROM movies_tbl" # we define what query should the app run.do not need the semi colone
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close() #we want the connection to close afterwards
    return json.dumps(data)  #to return the data, to dump this data as a string we use Json.dumps


@app.route("/movies-table/") 
def list_movie_table():
    cursor = mysql.connection.cursor()  
    query_string = "SELECT * FROM movies_tbl" 
    cursor.execute(query_string)
    data = cursor.fetchall()
    cursor.close() 
    return render_template("movies.html.tpl", movies_data =data)

if __name__ == "__main__":
    app.run(host="127.0.0.1")
