package poliSiniflar;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class MySQLConnection {
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/";
    String DBName = "yetkilisatici";
    String kulAdi = "root";
    String sifre = "";

    public Connection conn = null;
    public Statement st = null;
    
    public MySQLConnection() {
        baglan();
    }

    public MySQLConnection(String DBName, String kulAdi, String sifre ) {
        this.DBName = DBName;
        this.kulAdi = kulAdi;
        this.sifre = sifre;
        baglan();
    }
 
    public void baglan(){
        try {
            
            if(conn == null || conn.isClosed()) {
                Class.forName(driver);
                conn = DriverManager.getConnection(url+DBName, kulAdi, sifre);
                st = conn.createStatement();
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Hata : " + e);
        }
    }
    
    public void kapat(){
        try {
            if(!conn.isClosed()){
                conn.close();
              
            }
        } catch (Exception e) {
            System.err.println("Bağlantı Kapatma Hatası");
        }
    }
  
    public ResultSet data(String tableName) {
        ResultSet rs = null;
        try {
            rs = st.executeQuery("select * from " + tableName);
        } catch (Exception e) {
            System.err.println("Data Getirme Hatası : " + e.getLocalizedMessage());
        }
        return rs;
    }

    public int dataAdd(String query) {
        int sonuc = -1;
        
        try {
            sonuc = st.executeUpdate(query);
        } catch (Exception e) {
            System.err.println("Data Ekleme Hatası : " + e.getLocalizedMessage());
        }
        return sonuc;
    }
    public int dataDelete(String tblName, String data, String gelenVeri) {
        int sonuc = -1;
        try { 
            sonuc = st.executeUpdate("Delete from '"+tblName+"' where '"+data+"' = '"+ gelenVeri +"' ");
        } catch (Exception e) {
            System.err.println("Data Silme Hatası : " + e.getLocalizedMessage());
        }
        return sonuc;
    }
    public int dataUpdate(String query) {
        int sonuc = -1;
        try {
            sonuc = st.executeUpdate(query);
        } catch (Exception e) {
            System.err.println("Data Güncelleme Hatası : " + e.getLocalizedMessage());
        }
        return sonuc;
    }
    public int dataEkle(String tableName, String[] dizi) {
        int sonuc = -1;
        try {
            String sorgu = "insert into "+tableName+" values ('"+dizi[0]+"'";
            for (int i = 1; i<dizi.length; i++) {
                sorgu += ",'" + dizi[i] + "'";
            }
            sorgu += ")";
            System.out.println(sorgu);
            sonuc = st.executeUpdate(sorgu);
            
        } catch (Exception e) {
            System.err.println("Ekleme Hatası : " + e);
        }
    
        return sonuc;
    }
    
    
}
