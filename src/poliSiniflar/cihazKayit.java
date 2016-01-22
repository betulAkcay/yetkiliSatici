package poliSiniflar;

public class cihazKayit extends kayit {    
  
   
    @Override
    public void ekle(String tableName, String[] dizi) {
        MySQLConnection db = new MySQLConnection();
        int sonuc = db.dataEkle(tableName, dizi);
        
        if(sonuc > 0) {
            System.out.println("Kayıt Başarılı");
        } else {
            System.out.println("Kayıt Başarısız");
        }
        
    }
    
}
