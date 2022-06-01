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

def validateproddetail(sdi:int)->bool:
	sql:str = f"SELECT * FROM `product_sale_detail` WHERE `prod_detail_id`='{sdi}'"
	cursor = DATABASE.cursor()
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return len(slist)>0

def read_userName(username)->str:
    sql:str=f"SELECT lastname, firstname FROM `user` WHERE username ='{username}'"
    conn=DATABASE.cursor(dictionary=True)
    conn.execute(sql)
    slist:list=conn.fetchall()
    res = " ".join([ x['firstname'] for x in slist ] + [ x['lastname'] for x in slist ])
    return res

def read_cusid(username)->str:
    sql:str=f"SELECT customer_id FROM `customer` WHERE username ='{username}'"
    conn=DATABASE.cursor(dictionary=True)
    conn.execute(sql)
    slist:list=conn.fetchall()[0]
    return slist

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

def DELETEDATA(table:str,idno:int):
	try:
		sql:str = f"DELETE FROM `{table}` WHERE `product_id`={idno}"
		cursor = DATABASE.cursor()
		cursor.execute(sql)
		DATABASE.commit()
		cursor.close()
	except Exception:
		return False
	return True

def DELETEdefect(table:str,idno:int):
	try:
		sql:str = f"DELETE FROM `{table}` WHERE `defect_prod_id`={idno}"
		cursor = DATABASE.cursor()
		cursor.execute(sql)
		DATABASE.commit()
		cursor.close()
	except Exception:
		return False
	return True

def DELETEappoint(table:str,idno:int):
	try:
		sql:str = f"DELETE FROM `{table}` WHERE `appointment_id`={idno}"
		cursor = DATABASE.cursor()
		cursor.execute(sql)
		DATABASE.commit()
		cursor.close()
	except Exception:
		return False
	return True

def addproducts(data,flname,dt_string)->bool:
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
	okey=True
	return okey

def adddefect(data)->bool:
	ptype:int = data.get("ptype")
	pname:str = data.get("pname")
	sdi:int= data.get("sdi")
	qty:int = data.get("qty")
	dpprice:int = data.get("dpprice")
	pdefect:str = data.get("pdefect")
	sql = f"INSERT INTO `defect_prod_inventory` (`prod_detail_id`,`defect_prod_desc`,`product_name`,`quantity`,`product_price`,`product_type_id`) VALUE ('{sdi}','{pdefect}','{pname}','{qty}','{dpprice}','{ptype}')"
	cursor = DATABASE.cursor()
	cursor.execute(sql)
	DATABASE.commit()
	cursor.close()
	okey=True
	return okey

def addapp(data,cusid,dt_string)->bool:
	sid:int = data.get("sid")
	dname:str = data.get("dname")
	sdate:date = data.get("sdate")
	edate:date = data.get("edate")
	sql = f"INSERT INTO `appointment` (`customer_id`,`service_id`,`start_date`,`end_date`,`created_date`,`device_name`,`status`) VALUE ('{cusid}','{sid}','{sdate}','{edate}','{dt_string}','{dname}','pending')"
	cursor = DATABASE.cursor()
	cursor.execute(sql)
	DATABASE.commit()
	cursor.close()
	okey=True
	return okey

def updateproducts(table:str,id:int,fields:list=[],new_data:list=[])->bool:
	okey:bool=False
	if len(fields)==len(new_data):
		flds:str="`=%s, `".join(fields)
		flds+="`=%s"
		sql:str=f"UPDATE `{table}` SET `{flds} WHERE `product_id`={id}"
		cursor = DATABASE.cursor()
		cursor.execute(sql,new_data)
		DATABASE.commit()
		cursor.close()
		okey=True
	return okey

def updatedefects(table:str,id:int,fields:list=[],new_data:list=[])->bool:
	okey:bool=False
	if len(fields)==len(new_data):
		flds:str="`=%s, `".join(fields)
		flds+="`=%s"
		sql:str=f"UPDATE `{table}` SET `{flds} WHERE `defect_prod_id`={id}"
		cursor = DATABASE.cursor()
		cursor.execute(sql,new_data)
		DATABASE.commit()
		cursor.close()
		okey=True
	return okey

def updateappointment(table:str,id:int,fields:list=[],new_data:list=[])->bool:
	okey:bool=False
	if len(fields)==len(new_data):
		flds:str="`=%s, `".join(fields)
		flds+="`=%s"
		sql:str=f"UPDATE `{table}` SET `{flds} WHERE `appointment_id`={id}"
		cursor = DATABASE.cursor()
		cursor.execute(sql,new_data)
		DATABASE.commit()
		cursor.close()
		okey=True
	return okey


def getcustomer(username)->list:
	sql:str = f"SELECT `firstname`,`lastname`,`customer_id` FROM `customer` WHERE `username`='{username}'"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return slist

def getviewcustomer()->list:
	# sql:str = f"call getCustomer()" #"SELECT user.user_id, role.role_name, user.firstname, user.lastname,user.address FROM user, role WHERE role.role_id = user.role_id"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.callproc('getCustomer')
	# slist:list = cursor.stored_results()

	for result in cursor.stored_results():
		slist = result.fetchall()

	cursor.close()
	return slist

def getallemployee()->list:
	# sql:str = f"SELECT user.user_id, role.role_name, user.firstname, user.lastname,user.address FROM user, role WHERE role.role_id = user.role_id" #"SELECT user.user_id, role.role_name, user.firstname, user.lastname,user.address FROM user, role WHERE role.role_id = user.role_id"
	# cursor = DATABASE.cursor(dictionary=True)
	# cursor.execute(sql)
	# slist:list = cursor.fetchall()
	# cursor.close()
	# return slist
	cursor = DATABASE.cursor(dictionary=True)
	cursor.callproc('getallemployee')
	# slist:list = cursor.stored_results()

	for result in cursor.stored_results():
		slist = result.fetchall()

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
	# sql:str = f"select inventory.product_id, product_type_name, product_name, product_type_desc, stock_quantity, product_price, discount_price from product_type, inventory where product_type.product_type_id = inventory.product_type_id"
	# cursor = DATABASE.cursor(dictionary=True)
	# cursor.execute(sql)
	# elist:list = cursor.fetchall()
	# cursor.close()
	# return elist

	cursor = DATABASE.cursor(dictionary=True)
	cursor.callproc('get_products')
	# slist:list = cursor.stored_results()

	for result in cursor.stored_results():
		slist = result.fetchall()

	cursor.close()
	return slist

def get_defects()->list:
	# sql:str = f"select defect_prod_id, prod_detail_id, product_type_id, product_name,defect_prod_desc, quantity, product_price from defect_prod_inventory;"
	# cursor = DATABASE.cursor(dictionary=True)
	# cursor.execute(sql)
	# elist:list = cursor.fetchall()
	# cursor.close()
	# return elist

	cursor = DATABASE.cursor(dictionary=True)
	cursor.callproc('get_defects')
	# slist:list = cursor.stored_results()

	for result in cursor.stored_results():
		slist = result.fetchall()

	cursor.close()
	return slist

def get_custapp(username)->list:
	sql:str = f"select a.appointment_id, s.service_id, st.service_type_name, a.device_name, a.start_date, a.end_date, a.status, a.updated_by from appointment a, service s, service_type st, customer c where a.service_id = s.service_id AND s.service_type_id = st.service_type_id AND a.customer_id = c.customer_id && c.username = '{username}';"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	elist:list = cursor.fetchall()
	cursor.close()
	return elist

def getallcustapp()->list:
	sql:str = f"select a.appointment_id, c.customer_id, c.firstname as customer_firstname, c.lastname as customer_lastname, s.service_id, st.service_type_name,a.device_name, a.start_date, a.end_date, a.status, a.updated_by from appointment a, customer c, service s, service_type st where a.service_id = s.service_id AND s.service_type_id = st.service_type_id AND a.customer_id = c.customer_id;"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	elist:list = cursor.fetchall()
	cursor.close()
	return elist

def getallcustapp2()->list:
	sql:str = f"select a.appointment_id, c.customer_id, c.firstname as customer_firstname, c.lastname as customer_lastname, s.service_id, st.service_type_name,a.device_name, a.start_date, a.end_date, a.status from appointment a, customer c, service s, service_type st where a.service_id = s.service_id AND s.service_type_id = st.service_type_id AND a.customer_id = c.customer_id;"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	elist:list = cursor.fetchall()
	cursor.close()
	return elist