from db import new_cursor

class RepositoryDao():
    def update():
        pass

    def delete():
        pass
    
    def busca_nome():
        pass
    

# Exemplo de execução de query
if __name__ == "__main__":
    with new_cursor() as cursor:
        try:
            cursor.execute('select version()')
            result = cursor.fetchone()
            print(result)
        except Exception as error:
            print(error)
        else:
            print('Query well executed.')