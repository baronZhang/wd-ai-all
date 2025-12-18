# 使用 typing 模块，这是 JDK 之外最重要的库
from typing import List, Optional


# 3.10+ 这里的 list[str] 代替了以前的 List[str]
# | None 代替了 Optional[str] (Java 的 Union Type)
def process_data(items: list[str] | None) -> str | None:
    if items is None or len(items) == 0:
        return None
    return items[0]


# 故意写错类型，VS Code 会标红报错：
# Argument of type "int" cannot be assigned to parameter "items"
# result = process_data(123)


from typing import Protocol


class Connection(Protocol):
    def connect(self, url: str) -> bool: ...  # 类似 Java 接口的 ;


class MySQLDriver:
    # 不需要显式继承 Connection (Duck Typing 的显式化)
    def connect(self, url: str) -> bool:
        print(f"Connecting to MySQL: {url}")
        return True


class RedisDriver:
    def connect(self, url: str) -> bool:
        print(f"Connecting to Redis: {url}")
        return True


# 依赖注入风格
def start_service(db: Connection):
    db.connect("localhost")


start_service(MySQLDriver())  # Pass
# start_service("String")    # Error: "String" is incompatible with protocol "Connection"
