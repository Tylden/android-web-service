# MySQL-Rails-Test
## API USAGE

### Basic Authentication
username: `myfinance`  
password: `credit123`

### Content Type
application/XML or application/JSON

### Body
You can pass XML or JSON data in Body

sample JSON body
```
{
  "id" : "24",
  "first_name" : "arun",
  "last_name" : "yadav"
}
```

Sample XML body
```
<user>
  <email>24</email>
  <first-name>arun</first-name>
  <last-name>yadav</last-name>
</user>
```
> NOTE : Content Type should be set to application/XML for XML data in body
and to application/JSON for JSON data in body

### API Requests:

#### listing names
url: http://localhost:3000/api/v1/names  
method: `GET`  
body : not needed  

#### Creating names
url: http://localhost:3000/api/v1/names  
method: `POST`  
Body : It can be XML or JSON  

#### Updating names
url: http://localhost:3000/api/v1/names/:id  
method: `PUT`  
Body : It can be XML or JSON  

#### Deleting names
url: http://localhost:3000/api/v1/names/:id  
method: `DELETE`  
body : not needed  
