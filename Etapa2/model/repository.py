from __future__ import annotations

class Repository():
    def __init__(self, id: int, idUser: int, name: str, creationDate: str) -> None:
        self._id = id
        self._idUser = idUser
        self._name = name
        self._creationDate = creationDate
    
    def __str__(self):
        return f'Id: {self._id} IdUser: {self._idUser} Name: {self._name} CreationDate: {self._creationDate}'
    
    @property
    def id(self):
        return self._id
    
    @property
    def idUser(self):
        return self._idUser
    
    @property
    def name(self):
        return self._name
    
    @property
    def creationDate(self):
        return self._creationDate


if __name__ == "__main__":
    repo = Repository(1, 4, 'ApiAlbion', '2020-01-01 00:00:00 UTC')
    print(repo)