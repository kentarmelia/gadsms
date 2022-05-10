from flask import Flask,render_template,request,redirect,url_for,session
from database import ValidateUser,Validaterole,Validatecustomer,SAVE_DB,getcustomer,getstaff,get_products,addproducts,read_userName,DELETEDATA,updateproducts,get_defects,getviewcustomer,getallemployee
from datetime import datetime 
app = Flask(__name__)
app.secret_key = "sd455rsdgf"
now = datetime.now()
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
    if request.method == "POST":
        if ValidateUser(username,password):
            session["username"] = username
            role = Validaterole(username,password)
            if role == "Admin":
                username = session["username"]
                return redirect(url_for("adminhp"))
            if role == "Seller":
                session["username"] = username
                return redirect(url_for("sellersi"))
            if role == "Technician":
                username = session["username"]
                return redirect(url_for("technicianap"))
        elif Validatecustomer(username,password):
            session["username"] = username
            return redirect(url_for("customerap"))
        else:
            return redirect(url_for("login",message="LOGIN FAILED"))
    else:
        return redirect(url_for("login"))

@app.route("/register")
def register():
    return render_template("Register.html")

@app.route("/addcustomer",methods=["POST"])
def addcustomer():
    DATA:dict = {
        "lastname":request.form['lastname'],
        "firstname":request.form['firstname'],
        "email":request.form['email'],
        "address":request.form['address'],
        "contact":request.form['contact'],
        "username":request.form['username'],
        "password":request.form['password']
    }
    SAVE_DB(DATA)
    return redirect(url_for("login",message="register successfully"))
#---------------------------------------------------- ADMIN PAGE-----------------------------------------------------------------
@app.route("/adminap")
def adminap():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("AdminAP.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("adminap"))
        return redirect(url_for("login"))

@app.route("/admindi")
def admindi():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        plist = get_defects()
        hlist:list=['DEFECT PRODUCT ID','SALE DETAIL ID','PRODUCT ID','PRODUCT NAME','QTY','PRODUCT PRICE','ACTION']
        return render_template("AdminDI.html",slist = slist,pageheader = hlist,plist=plist)
    else:
        if "username" in session:
            return redirect(url_for("admindi"))
        return redirect(url_for("login"))

@app.route("/adminem")
def adminem():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        plist = getallemployee()
        hlist:list=['ID','ROLE','FIRSTNAME','LASTNAME','ADDRESS']
        return render_template("AdminEM.html",slist = slist,pageheader=hlist,plist=plist)
    else:
        if "username" in session:
            return redirect(url_for("adminem"))
        return redirect(url_for("login"))

@app.route("/adminhp")
def adminhp():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("AdminHP.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("adminhp"))
        return redirect(url_for("login"))
  
@app.route("/adminin")
def adminin():
    uname = request.args.get('uname', None)
    if "username" in session:
        username = session["username"]
        hlist:list=['PRODUCT ID','PRODUCT TYPE NAME','PRODUCT NAME','PRODUCT DESC.','STOCK QTY','PRODUCT PRICE','DISCOUNT PRICE','ACTION']
        plist = get_products()
        slist = getstaff(username)
        return render_template("AdminIN.html",slist = slist,pageheader = hlist,plist = plist,uname=uname)
    else:
        if "username" in session:
            return redirect(url_for("adminin"))
        return redirect(url_for("login"))

@app.route("/adminvc")
def adminvc():
    if "username" in session:
        username = session["username"]
        hlist:list=['Customer ID','LASTNAME','FIRSTNAME','ADDRESS']
        slist = getstaff(username)
        plist = getviewcustomer()
        return render_template("AdminVC.html",slist = slist,pageheader = hlist,plist = plist)
    else:
        if "username" in session:
            return redirect(url_for("adminvc"))
        return redirect(url_for("login"))

@app.route("/adminvs")
def adminvs():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("AdminVS.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("adminvs"))
        return redirect(url_for("login"))

#------------------------------------------------------CUSTOMER------------------------------------------------------------------

@app.route("/customerap")
def customerap():
    if "username" in session:
        username = session["username"]
        slist = getcustomer(username)
        return render_template("CustomerAP.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("customerap"))
        return redirect(url_for("login"))

@app.route("/customerma")
def customerma():
    if "username" in session:
        username = session["username"]
        slist = getcustomer(username)
        return render_template("CustomerMA.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("customerma"))
        return redirect(url_for("login"))

#-------------------------------------------------------SELLER--------------------------------------------------------------------

@app.route("/sellersi")
def sellersi():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("SellerSI.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("sellersi"))
        return redirect(url_for("login"))

@app.route("/sellervc")
def sellervc():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("SellerVC.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("sellervc"))
        return redirect(url_for("login"))
#------------------------------------------------------TECHNICIAN-----------------------------------------------------------------
@app.route("/technicianap")
def technicianap():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("TechnicianAP.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("technicianap"))
        return redirect(url_for("login"))

@app.route("/technicianvc")
def technicianvc():
    if "username" in session:
        username = session["username"]
        slist = getstaff(username)
        return render_template("TechnicianVC.html",slist = slist)
    else:
        if "username" in session:
            return redirect(url_for("technicianvc"))
        return redirect(url_for("login"))
#----------------------------------------------ADD----DELETE----UPDATE--------------------------------------------------
@app.route("/addproduct",methods=["POST","GET"])
def addproduct():
    firstname = ""
    message=""
    if "username" in session:
        username = session["username"]
        uname = read_userName(username)
        DATA:dict = {
            "ptype":request.form['ptype'],
            "pname":request.form['pname'],
            "pprice":request.form['pprice'],
            "qty":request.form['qty'],
            "dprice":request.form['dprice']
        }
        flag:int=int(request.form["flag"])
        pid=request.form["id"]
        ptype:int=int(request.form["ptype"])
        pname:str=request.form["pname"]
        pprice:float=float(request.form["pprice"])
        dprice:float=float(request.form["dprice"])
        qty:int=int(request.form["qty"])
        dt_string = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        fields:list=['product_id','product_type_id','product_name','product_price','discount_price','stock_quantity','updated_by','updated_date']
        data:list=[pid,ptype,pname,pprice,dprice,qty,uname,dt_string]
        #addproducts(DATA,uname,dt_string)
        if flag == 0:
            okey:bool=addproducts(DATA,uname,dt_string)
            if okey:
                message = "Product Added"
            else:
                message = "Error adding Product"
        if flag == 1:
            okey:bool=updateproducts("inventory",pid,fields,data)
            if okey:
                message = "Product updated"
            else:
                message = "Error Updating Product"
        return redirect(url_for("adminin",message=message))
    else:
        return redirect(url_for("login"))
@app.route("/deleteproduct",methods=["GET"])
def deleteproduct():
    id:int=request.args.get("id")
    okey:bool = DELETEDATA("inventory",id)
    if okey:
        return redirect(url_for("adminin",message="Product Removed"))
    else:
        return redirect(url_for("adminin",message="Error Removing Product"))
#-------------------------------------------LOG-OUT---------------------------------------------------------------------
@app.route("/logout")
def logout():
    session.pop("username",None)
    return redirect(url_for("login",message="LOGOUT"))


if __name__ == "__main__":
    app.run(host="0.0.0.0",debug=True)