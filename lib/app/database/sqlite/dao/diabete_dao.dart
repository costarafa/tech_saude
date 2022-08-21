class DiabeteDAOIpml implements DiabeteDAO{
  Database _db;


  Future<List<Diabete>> find() async{
    _db = await Connection.get();
    
  }
}