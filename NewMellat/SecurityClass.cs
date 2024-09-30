using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;

namespace NewMellat
{
    public class SecurityClass
    {
        public static string ToHash(string text)
        {
            return FormsAuthentication.HashPasswordForStoringInConfigFile(text, "SHA1");
        }

        private static byte[] key = { };

        private static byte[] IV = { 38, 55, 206, 48, 28, 64, 20, 16 };

        private static string stringKey = "Mellatkey";

        public static string EncryptText(string text)
        {

            try
            {

                key = Encoding.UTF8.GetBytes(stringKey.Substring(0, 8));
                
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();

                Byte[] byteArray = Encoding.UTF8.GetBytes(text);
                
                MemoryStream memoryStream = new MemoryStream();

                CryptoStream cryptoStream = new CryptoStream(memoryStream,

                    des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                
                cryptoStream.Write(byteArray, 0, byteArray.Length);

                cryptoStream.FlushFinalBlock();
                
                return Convert.ToBase64String(memoryStream.ToArray());

            }

            catch
            {

              

            }



            return string.Empty;

        }

        public static string DecryptText(string text)
        {

            //try
            //{

            key = Encoding.UTF8.GetBytes(stringKey.Substring(0, 8));



            DESCryptoServiceProvider des = new DESCryptoServiceProvider();

            Byte[] byteArray = Convert.FromBase64String(text);



            MemoryStream memoryStream = new MemoryStream();

            CryptoStream cryptoStream = new CryptoStream(memoryStream,

                des.CreateDecryptor(key, IV), CryptoStreamMode.Write);



            cryptoStream.Write(byteArray, 0, byteArray.Length);

            cryptoStream.FlushFinalBlock();



            return Encoding.UTF8.GetString(memoryStream.ToArray());

            //}

            //catch (Exception ex)
            //{


            //}



            //     return string.Empty;
        }

        public static bool IsHashTrue(string text, string hashedText)
        {
            if (ToHash(text) == hashedText)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool IsAccess(string code, string pageName, int access)
        {
            NewMellatEntities db = new NewMellatEntities();
            string encPageName = EncryptText(pageName);
            string encCode = EncryptText(code);
            var info = db.tbAminPremissionAccesses.Where(n => n.acCode == encCode && n.acPage == encPageName && n.acPremission == access);
            if (info.Count() > 0)
                return true;
            else
                return false;
        }
        public static bool IsValid(string code, string pageName)
        {
            NewMellatEntities db = new NewMellatEntities();
            //string encPageName = EncryptText(pageName);
            string encPageName = pageName;
            string encCode = EncryptText(code);
            var info = db.tbAdminInPages.Where(n => n.pgCode == encCode && n.pgPageName == encPageName);

            var ssss = info.Count();

            if (info.Count() > 0)
                return true;
            else
                return false;
        }

    }

}