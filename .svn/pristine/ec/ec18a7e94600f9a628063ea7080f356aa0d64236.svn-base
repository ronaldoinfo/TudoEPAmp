using System;
using System.Collections.Specialized;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Security
{
    public static class Fingerprinter
    {
        public static string FingerPrint { get; private set; }

        private static readonly MD5 _hasher = MD5.Create();

        public static string Generate(NameValueCollection availableVariables)
        {
            string ipAddress = GetIpAddress(availableVariables);
            string protocol = !string.IsNullOrEmpty(availableVariables["SERVER_PROTOCOL"]) ? availableVariables["SERVER_PROTOCOL"] : string.Empty;
            string encoding = !string.IsNullOrEmpty(availableVariables["HTTP_ACCEPT_ENCODING"]) ? availableVariables["HTTP_ACCEPT_ENCODING"] : string.Empty;
            string language = !string.IsNullOrEmpty(availableVariables["HTTP_ACCEPT_LANGUAGE"]) ? availableVariables["HTTP_ACCEPT_LANGUAGE"] : string.Empty;
            string userAgent = !string.IsNullOrEmpty(availableVariables["HTTP_USER_AGENT"]) ? availableVariables["HTTP_USER_AGENT"] : string.Empty;
            string accept = !string.IsNullOrEmpty(availableVariables["HTTP_ACCEPT"]) ? availableVariables["HTTP_ACCEPT"] : string.Empty;

            string stringToTokenise = ipAddress + protocol + encoding + language + userAgent + accept;

            FingerPrint = GetMd5Hash(_hasher, stringToTokenise);
            return FingerPrint;
        }

        private static string GetIpAddress(NameValueCollection availableVariables)
        {
            string address = string.Empty;

            if (!string.IsNullOrEmpty(availableVariables["HTTP_CLIENT_IP"]))
            {
                address = availableVariables["HTTP_CLIENT_IP"];
            }
            if (!string.IsNullOrEmpty(availableVariables["HTTP_X_FORWARDED_FOR"]))
            {
                address = availableVariables["HTTP_X_FORWARDED_FOR"];
            }
            if (!string.IsNullOrEmpty(availableVariables["REMOTE_ADDR"]))
            {
                address = availableVariables["REMOTE_ADDR"];
            }
            if (string.IsNullOrEmpty(address))
            {
                address = "0.0.0.0";
            }
            return address;
        }

        private static string GetMd5Hash(MD5 md5Hash, string input)
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            return sBuilder.ToString();
        }
    }
}