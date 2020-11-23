from pathlib import Path

path = r'/Users/number/PycharmProjects/djangoStudy/PythonScript/pathlibTest.py'
p = Path(path)
print("文件名:", p.name)       # 获取文件名
print("文件名除后缀:", p.stem)       # 获取文件名除后缀的部分
print("文件后缀:", p.suffix)     # 获取文件后缀
print("dirname:", p.parent)     # 相当于dirname
print("按目录逐级查找:", p.parent.parent.parent)
print("父目录:", type(p.parents), p.parents)    # 返回一个iterable(可迭代对象) 包含所有父目录
for i in p.parents:
    print(i)
print(p.parts)      # 将路径通过分隔符分割成一个元组


