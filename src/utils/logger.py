import os


def clean_stan_files(func):
    def wrapper(*args, **kwargs):
        # 実行前に不要なファイルを削除
        for file_name in os.listdir():
            if file_name.endswith(".hpp") or "." not in file_name:
                os.remove(file_name)

        # 関数を実行
        result = func(*args, **kwargs)

        # 実行後に再度不要なファイルを削除
        for file_name in os.listdir():
            if file_name.endswith(".hpp") or "." not in file_name:
                os.remove(file_name)

        return result

    return wrapper
