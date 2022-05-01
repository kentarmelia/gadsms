from mysql import connector
import random



DATABASE = connector.connect(
    host = "127.0.0.1",
    user = "root",
    password = "",
    database = 'gadsms'
)

def ValidateUser(username:str,password:str)->bool:
	sql:str = f"SELECT * FROM `user` WHERE `username`='{username}' and `password`='{password}'"
	cursor = DATABASE.cursor()
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return len(slist)>0

def Validatecustomer(username:str,password:str)->bool:
	sql:str = f"SELECT * FROM `customer` WHERE `username`='{username}' and `password`='{password}'"
	cursor = DATABASE.cursor()
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return len(slist)>0

def Validaterole(username:str,password:str)->str:
    sql:str = f"SELECT role.role_name from `role`, `user` WHERE role.role_id = user.role_id && user.username = '{username}' && user.password = '{password}'"
    cursor = DATABASE.cursor()
    cursor.execute(sql)
    role:str = cursor.fetchone()[0]
    cursor.close()
    return role

def read_userName(username)->str:
    sql:str=f"SELECT lastname, firstname FROM `user` WHERE username ='{username}'"
    conn=DATABASE.cursor(dictionary=True)
    conn.execute(sql)
    slist:list=conn.fetchall()
    res = " ".join([ x['firstname'] for x in slist ] + [ x['lastname'] for x in slist ])
    return res

def SAVE_DB(data:dict):
    lastname:str = data.get("lastname")
    firstname:str = data.get('firstname')
    address:str = data.get("address")
    email:str = data.get("email")
    contact:str = data.get("contact")
    username:str = data.get("username")
    password:str = data.get("password")
    num = random.randint(10000000,99999999)
    sql = f"INSERT INTO `customer` (`customer_id`,`lastname`,`firstname`,`address`,`phone`,`email`,`username`,`password`) VALUE ('{num}','{lastname}','{firstname}','{address}','{contact}','{email}','{username}','{password}')"
    cursor = DATABASE.cursor()
    cursor.execute(sql)
    DATABASE.commit()
    cursor.close()

def addproducts(data,flname,dt_string):
	p_id = random.randint(10000,99999)
	ptype:str = data.get("ptype")
	pname:str = data.get("pname")
	pprice:str = data.get("pprice")
	qty:str = data.get("qty")
	dprice:str = data.get("dprice")
	sql = f"INSERT INTO `inventory` (`product_id`,`product_type_id`,`product_name`,`product_price`,`discount_price`,`stock_quantity`,`create_by`,`create_date`,`updated_by`,`updated_date`) VALUE ('{p_id}','{ptype}','{pname}','{pprice}','{dprice}','{qty}','{flname}','{dt_string}','{flname}','{dt_string}')"
	cursor = DATABASE.cursor()
	cursor.execute(sql)
	DATABASE.commit()
	cursor.close()


def getcustomer(username)->list:
	sql:str = f"SELECT `firstname`,`lastname`,`customer_id` FROM `customer` WHERE `username`='{username}'"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return slist

def getstaff(username)->list:
	sql:str = f"SELECT user.firstname, user.lastname, user.user_id,role.role_name FROM `user`, `role` WHERE role.role_id = user.role_id && username = '{username}'"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return slist

def get_products()->list:
	sql:str = f"select inventory.product_id, product_type_name, product_name, product_type_desc, stock_quantity, product_price, discount_price from product_type, inventory where product_type.product_type_id = inventory.product_type_id"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	elist:list = cursor.fetchall()
	cursor.close()
	return elist