class Stars():
    def __init__(self, idContrib: int, idRepo: int, date: str):
        self._idContrib = idContrib
        self._idRepo = idRepo
        self._date = date
    
    @property
    def idContrib(self):
        return self._idContrib
    
    @property
    def idRepo(self):
        return self._idRepo
    
    @property
    def date(self):
        return self._date