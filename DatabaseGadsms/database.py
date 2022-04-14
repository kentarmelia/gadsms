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

def SAVE_DB(data:dict):
    lastname:str = data.get("lastname")
    firstname:str = data.get('firstname')
    address:str = data.get("address")
    email:str = data.get("email")
    contact:str = data.get("contact")
    username:str = data.get("username")
    password:str = data.get("password")
    num = random.randint(11111111,99999999)
    sql = f"INSERT INTO `customer` (`customer_id`,`lastname`,`firstname`,`address`,`phone`,`email`,`username`,`password`) VALUE ('{num}','{lastname}','{firstname}','{address}','{contact}','{email}','{username}','{password}')"
    cursor = DATABASE.cursor()
    cursor.execute(sql)
    DATABASE.commit()
    cursor.close()

def getcustomer(idnum)->list:
	sql:str = f"SELECT `firstname`,`lastname`,`customer_id` FROM `customer`WHERE `customer_id` = '{idnum}'"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	slist:list = cursor.fetchall()
	cursor.close()
	return slist

def getcustomerid(username:str,password:str)->list:
	sql:str = f"SELECT `customer_id` FROM `customer` WHERE `username`='{username}' && `password`='{password}'"
	cursor = DATABASE.cursor(dictionary=True)
	cursor.execute(sql)
	slist:list = cursor.fetchone()
	cursor.close()
	return slist