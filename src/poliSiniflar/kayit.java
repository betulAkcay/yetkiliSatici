package poliSiniflar;



public class kayit {
    
    public void ekle(String tableName, String[] dizi) {
        MySQLConnection db = new MySQLConnection();
        int sonuc = db.dataEkle(tableName, dizi);
        
        if(sonuc > 0) {
            System.out.println("Kayıt Başarılı");
        } else {
            System.out.println("Kayıt Başarısız");
        }
        
    }
    
//     public int dataEkle(String tableName, String[] dizi) {
//        int sonuc = -1;
//         Statement st;
//        try {
//            String sorgu = "insert into "+tableName+" values ('"+dizi[0]+"'";
//            for (int i = 1; i<dizi.length; i++) {
//                sorgu += ",'" + dizi[i] + "'";
//            }
//            sorgu += ")";
//            System.out.println(sorgu);
//            sonuc = st.executeUpdate(sorgu);
//            
//        } catch (Exception e) {
//            System.err.println("Ekleme Hatası : " + e);
//        }
//    
//        return sonuc;
//    }
}
