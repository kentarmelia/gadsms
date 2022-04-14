from flask import Flask,render_template,request,redirect,url_for,session
from database import ValidateUser,Validaterole,Validatecustomer,SAVE_DB,getcustomer,getcustomerid

app = Flask(__name__)
app.secret_key = "3asdrsdgf"
idnum = ""
#---------------------------------------------LOGIN & REGISTER PAGE---------------------------------------------------------
@app.route("/")
def home():
    return redirect("/login")

@app.route("/<message>")
def index(message:str):
    return render_template("Login.html")

@app.route("/login", methods=["POST"])
def login():
    username:str = request.form["username"]
    password:str = request.form["password"]

    if ValidateUser(username,password):
        session['username'] = username
        role = Validaterole(username,password)
        if role == "Admin": 
            return redirect(url_for("adminhp"))
        if role == "Seller":
            return redirect(url_for("sellersi"))
        if role == "Technician":
            return redirect(url_for("technicianap"))
    elif Validatecustomer(username,password):
        return render_template("CustomerAP.html",message=username)
    else:
        return redirect(url_for("login",message="LOGIN FAILED"))

@app.route("/register")
def register():
    return render_template("Register.html")

@app.route("/addcustomer",methods=["POST"])
def addcustomer():
    DATA:dict = {
        "lastname":request.form['lastname'],
        "firstname":request.form['firstname'],
        "email":request.form['email'],
        "contact":request.form['contact'],
        "username":request.form['username'],
        "password":request.form['password']
    }
    SAVE_DB(DATA)
    return redirect(url_for("login",message="register successfully"))
#---------------------------------------------------- ADMIN PAGE-----------------------------------------------------------------
@app.route("/adminap")
def adminap():
    return render_template("AdminAP.html")

@app.route("/admindi")
def admindi():
    return render_template("AdminDI.html")

@app.route("/adminem")
def adminem():
    return render_template("AdminEM.html")

@app.route("/adminhp")
def adminhp():
   return render_template("AdminHP.html")
  

@app.route("/adminin")
def adminin():
    return render_template("AdminIN.html")

@app.route("/adminvc")
def adminvc():
    return render_template("AdminVC.html")

@app.route("/adminvs")
def adminvs():
    return render_template("AdminVS.html")

#------------------------------------------------------CUSTOMER------------------------------------------------------------------

@app.route("/customerap")
def customerap():

    return render_template("CustomerAP.html")

@app.route("/customerma")
def customerma():

    return render_template("CustomerMA.html")

#-------------------------------------------------------SELLER--------------------------------------------------------------------

@app.route("/sellersi")
def sellersi():
    return render_template("SellerSI.html")

@app.route("/sellervc")
def sellervc():
    return render_template("SellerVC.html")
#------------------------------------------------------TECHNICIAN-----------------------------------------------------------------
@app.route("/technicianap")
def technicianap():
    return render_template("TechnicianAP.html")

@app.route("/technicianvc")
def technicianvc():
    return render_template("TechnicianVC.html")

@app.route("/logout")
def logout():
    return redirect(url_for("login",message="LOGOUT"))

@app.after_request
def after_request(response):
    session.clear()
    response.headers.add('Cache-Control', 'no-store,no-cache,must-revalide,post-check=0,pre-check=0')
    return response

if __name__ == "__main__":
    app.run(host="0.0.0.0",debug=True)