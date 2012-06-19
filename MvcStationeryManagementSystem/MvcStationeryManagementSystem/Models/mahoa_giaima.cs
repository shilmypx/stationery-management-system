using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;

namespace MvcStationeryManagementSystem.Models
{
    public class mahoa_giaima
    {
        public static string maHoa(string strMaHoa)
        {
            byte[] arrKey;
            byte[] arrMahoa = UTF8Encoding.UTF8.GetBytes(strMaHoa);

            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            //Lấy giá trị key từ file Web.config
            string keyConfig = (string)settingsReader.GetValue("keyMD5", typeof(String));

            MD5CryptoServiceProvider serviceMD5 = new MD5CryptoServiceProvider();
            arrKey = serviceMD5.ComputeHash(UTF8Encoding.UTF8.GetBytes(keyConfig));
            serviceMD5.Clear();//Giải phóng tài nguyên
            TripleDESCryptoServiceProvider tdsp = new TripleDESCryptoServiceProvider();

            //Thiết lập 1 key cho thuật toán mã hóa
            tdsp.Key = arrKey;

            //Chọn phương thức mã hóa. Ở đây chúng ta chọn ECB(Electronic code Book ) [1]
            tdsp.Mode = CipherMode.ECB;

            //Thêm phương thức mã hóa IS010126 (random chuỗi kết quả)  [2]
            tdsp.Padding = PaddingMode.ISO10126;

            ICryptoTransform cTransform = tdsp.CreateEncryptor();
            byte[] arrKQ = cTransform.TransformFinalBlock(arrMahoa, 0, arrMahoa.Length);
            tdsp.Clear(); //Giải phóng tài nguyên của TripleDES Encryptor

            //Kết quả mã hóa được trả về 1 giá trị kiểu String
            return Convert.ToBase64String(arrKQ, 0, arrKQ.Length);
        }

        public static string giaiMa(string strGiaiMa)
        {
            byte[] arrKey;
            byte[] arrMahoa = Convert.FromBase64String(strGiaiMa);
            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            // Lấy giá trị key từ file Web.config
            string keyConfig = (string)settingsReader.GetValue("keyMD5", typeof(String));

            MD5CryptoServiceProvider serviceMD5 = new MD5CryptoServiceProvider();
            arrKey = serviceMD5.ComputeHash(UTF8Encoding.UTF8.GetBytes(keyConfig));
            serviceMD5.Clear(); //Giải phóng tài nguyên
            TripleDESCryptoServiceProvider tdsp = new TripleDESCryptoServiceProvider();

            //Thiết lập 1 key cho thuật toán giải mã
            tdsp.Key = arrKey;

            //Chọn phương thức giải mã. Ở đây chúng ta chọn ECB(Electronic code Book) [1]
            tdsp.Mode = CipherMode.ECB;

            //Thêm phương thức giải mã IS010126 (random chuỗi kết quả) [2]
            tdsp.Padding = PaddingMode.ISO10126;

            ICryptoTransform cTransform = tdsp.CreateDecryptor();
            byte[] arrKQ = cTransform.TransformFinalBlock(arrMahoa, 0, arrMahoa.Length);
            tdsp.Clear(); //Giải phóng tài nguyên của TripleDES Encryptor

            // Kết quả giải mã được trả về 1 giá trị kiểu String
            return UTF8Encoding.UTF8.GetString(arrKQ);
        }
    }
}
