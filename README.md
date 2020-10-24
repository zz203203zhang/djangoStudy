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

    
    











