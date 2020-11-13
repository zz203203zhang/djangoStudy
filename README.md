# Python Django Notes
## 1. Django安装
## 2. Django框架使用
### 2.1. 项目创建
#### 2.1.1. django-admin
使用django-admin指令创建Django项目
```django-admin startproject projectName```

### 2.2. 项目启动
#### 2.2.1. 命令启动
使用manage.py进行启动 
```python3 manage.py runserver```
### 2.3. Django项目目录结构
#### 2.3.1. manage.py
包含执行django中的各项操作的指令（子命令）
> 启动服务：runserver
> 创建应用：startapp
> 创建管理员：createsuperuser
获取帮助手册./manage.py help
#### 2.3.2. 主目录（与项目名称一致的目录）
##### 2.3.2.1. __init__.py
项目的初始化文件，服务被启动，该文件自动被运行
##### 2.3.2.2. urls.py
项目的基础url配置文件（基础的路由设置）
##### 2.3.2.3. wsgi.py
Web Server Gateway Interface
Web服务网关接口
##### 2.3.2.4. setting.py
项目的配置文件
+ BASE_DIR : 获取当前项目的绝对路径
+ DEBUG : 是否启用调试模式（True Or False）
+ SECRET_KEY : 密钥，用于用户密码、CSRF和会话Session等数据加密
+ ALLOWD_HOSTS : 设置允许访问到本项目的地址列表
    + 如果为空，只有localhost可以访问
    + 如果写'*'表示0.0.0.0，启动方式./manage.py runserver 0.0.0.0:端口号
+ INSTALLED_APPS : 指定已安装的应用
    + admin：内置的后台管理系统
    + auth：内置的用户认证系统
    + contenttypes：记录项目中所有model元数据（Django的ORM框架）
    + sessions：Session会话功能，用于标识当前访问网站用户的身份，记录用户信息
    + messages：消息提示功能
    + staticfiles：查找静态资源路径
+ MIDDLEWARE : 中间件，如果有自定义中间件，需要在此注册
+ ROOT_URLCONF : 用于指定项目的基础路由配置文件
+ TEMPLATES : 指定模板的信息
+ DATABASES : 指定数据库信息
+ LANGUAGE_CODE : 语言设置，如果需要中文，设置为"zh-Hans"
+ TIME_ZONE : 时区，如果指定中国时区，设置为"Asia/Shanghai"
+ STATIC_URL : 静态文件访问路径 

    
  
## 3. URL的使用
### 3.1. urls.py
默认在主目录中，主路由配置文件，会包含最基本的地址映射。
作用：通过urls中定义好的地址找到对应的视图处理函数
### 3.2. url语法

作用：为了匹配用户的访问路径

from django.conf.urls import url

语法：

​	url(regex,views,kwargs=None,name=None)

	+ regex：允许是正则表达式，匹配请求的url
	+ views：对应的视图处理函数的名称
	+ kwargs：字典，用于向views传参，如果没有参数可省略
	+ name：为url起别名，在地址反向解析的时候使用

### 3.3. 通过url向视图传参

#### 3.3.1. 使用正则表达式传参

使用子组传参，一个子组就是一个参数，要传递多个参数的话需要使用多个子组，中间用 / 隔开

子组 - () 一个小括号表示一个子组

`````` python
urlpatterns = [
  # 当访问路径是show/的时候，交给show——views处理
  url(r'^show/$', show_views),
  # 当访问路径是show/两位数字的时候，交给show1_views处理
  url(r'^show/(\d{2})/$', show1_views),
]

views.py
def show1_views(request, num1):
  # num1表示就是路径“show/”后面的第一个参数
  pass
``````

#### 3.3.2. 使用url()第三个参数 - 字典传参（不推荐）

url传参

``````python
dic = {
  'name': 'number',
  'age': 18,
}

url(r'^show3/$', show3_views, dic)
``````

视图处理函数

``````python
views.py
def show3_views(request, name, age):
  pass
``````

#### 3.3.3. 通过传统的”?”传递参数

例如，http://127.0.0.1:8000/plist/?p1=china&p2=2012，url中‘?’之后表示传递的参数，这里传递了p1和p2两个参数。

通过这样的方式传递参数，就不会出现因为正则匹配错误而导致的问题了。在Django中，此类参数的解析是通过request.GET.get方法获取的。

配置URL及其视图如下：

``````python
(r'^plist/$', helloParams1）
  
def helloParams(request):
    p1 = request.GET.get('p1')
    p2 = request.GET.get('p2')
    return HttpResponse("p1 = " + p1 + "; p2 = " + p2)
``````



## 4. Django中的应用APP

### 4.1. 应用的概念

应用就是网站汇总的一个独立的程序模块，在Django中，主目录一般不处理用户的具体请求，主目录主要做的是项目的初始化以及请求的分发（分布式请求处理），而具体的请求由各个应用去处理。

### 4.2. 创建应用

#### 4.2.1. 创建命令

`````` shell
./manage.py startapp 应用名称
ex:
	./manage.py startapp news
``````

#### 4.2.2. 应用注册

在setting.py中进行注册，在INSTALLED_APPS中追加应用名称

``````py
setting.py
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'news',
]
``````

#### 4.2.3. 应用的结构组成

##### 4.2.3.1. migrations 目录

存放数据的中建文件

##### 4.2.3.2. &#95;&#95;init&#95;&#95;.py

应用初始化文件

##### 4.2.3.3. admin.py

应用的后台管理配置文件

##### 4.2.3.4. app.py

应用的属性配置文件

##### 4.2.3.5. models.py

Models与模型相关的映射文件

##### 4.2.3.6. tests.py

应用的单元测试文件

##### 4.2.3.7. views.py

定义视图处理函数的文件











