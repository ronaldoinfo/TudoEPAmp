using System;
using System.Web.Services.Protocols;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for Seguranca
/// </summary>
/// 
[Serializable]
public class ClassSeguranca : SoapHeader
{
    public string Usuario { get; set; }
    public string Senha { get; set; }

	public ClassSeguranca()
	{

	}

    private static string ChavePrivada { get { return "#VIA-eptv@" + "*"; } }

    public static string GetHash(string pValor)
    {
        SHA1 sha1 = SHA1CryptoServiceProvider.Create();
        return DigStringFromBytes(sha1.ComputeHash(Encoding.UTF8.GetBytes(pValor)));
    }

    private static byte[] GetHashMD5(string pValor)
    {
        MD5 md5 = MD5CryptoServiceProvider.Create();
        return md5.ComputeHash(UTF32Encoding.ASCII.GetBytes(pValor));
    }

    private static string DigStringFromBytes(byte[] bytes)
    {
        var sb = new StringBuilder();
        foreach (byte b in bytes)
        {
            var hex = b.ToString("x2");
            sb.Append(hex);
        }
        return sb.ToString().ToUpper();
    }
}

