using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.IO;
using FrameworkExtension;

/// <summary>
/// Summary description for ClassValidacao
/// </summary>
public class ClassValidacao
{
    public static bool EmailValido(string Email)
    {
        return new Regex(@"^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$").IsMatch(Email);
    }

    public static void ValidarArquivo(string Identificador, HttpPostedFile ArquivoEnviado)
    {
        string XmlPath = HttpContext.Current.Server.MapPath("/xml/upload/upload.xml");
        FileStream _File = new FileStream(XmlPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
        XElement XmlConfiguracao = XElement.Load(_File).Elements("Configuracao").Where(e => e.Element("Nome").Value == Identificador).FirstOrDefault();
        _File.Close();

        if (XmlConfiguracao != null)
        {
            int TamanhoMaximo = 0;
            string ExtencoesPermitidas = "";

            int.TryParse(XmlConfiguracao.Element("TamanhoMaximo").Value, out TamanhoMaximo);
            ExtencoesPermitidas = XmlConfiguracao.Element("ExtencoesPermitidas").Value;

            if (ArquivoEnviado.ContentLength > (TamanhoMaximo * 1048576))
            {
                throw new BusinessException("O tamanho do arquivo ultrapassa máximo permitido, que é '" + TamanhoMaximo + " Mb.'");
            }

            if (!ExtencoesPermitidas.ToLower().Contains(ArquivoEnviado.FileName.ToLower().Split('.').Last()))
            {
                throw new BusinessException("Formato do arquivo inválido. São aceitos apenas arquivos no(s) formato(s):" + ExtencoesPermitidas.Replace("|", ", "));
            }
        }
        else
        {
            throw new BusinessException("Não foi possivel encontrar a configuração de envio de arquivos.");
        }
    }

    public static bool CPFValido(string CPF)
    {
        int[] ValoresCalculo = { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 },
                IndexInicioCalculo = { 1, 0 };
        bool CPFValido = true;

        CPF = Regex.Replace(CPF, "[^0-9]", "");

        if (CPF.Length != 11)
        {
            CPFValido = false;
        }
        else
        {
            string CPFGerado = CPF.Substring(0, 9);

            foreach (int Inicio in IndexInicioCalculo)
            {
                int Somatoria = 0,
                    Resto = 0;

                for (int index = 0; index < ValoresCalculo.Count(); index++)
                {
                    int Fator = ValoresCalculo[index];

                    if (index >= Inicio)
                    {
                        Somatoria += (Fator * int.Parse(CPF.Substring(index - Inicio, 1)));
                    }
                }

                Resto = (Somatoria % 11);

                if (Resto < 2)
                {
                    CPFGerado += "0";
                }
                else
                {
                    CPFGerado += (11 - Resto).ToString();
                }

                if (!CPF.Contains(CPFGerado))
                {
                    CPFValido = false;
                    break;
                }
            }
        }
        return CPFValido;
    }

    public static bool CNPJValido(string CNPJ)
    {
        int[] ValoresCalculo = { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 },
                IndexInicioCalculo = { 1, 0 };
        bool CNPJValido = true;

        CNPJ = Regex.Replace(CNPJ, "[^0-9]", "");

        if (CNPJ.Length != 14)
        {
            CNPJValido = false;
        }
        else
        {
            string CNPJGerado = CNPJ.Substring(0, 12);

            foreach (int Inicio in IndexInicioCalculo)
            {
                int Somatoria = 0,
                    Resto = 0;

                for (int index = 0; index < ValoresCalculo.Count(); index++)
                {
                    int Fator = ValoresCalculo[index];

                    if (index >= Inicio)
                    {
                        Somatoria += (Fator * int.Parse(CNPJ.Substring(index - Inicio, 1)));
                    }
                }

                Resto = (Somatoria % 11);

                if (Resto < 2)
                {
                    CNPJGerado += "0";
                }
                else
                {
                    CNPJGerado += (11 - Resto).ToString();
                }

                if (!CNPJ.Contains(CNPJGerado))
                {
                    CNPJValido = false;
                    break;
                }
            }
        }
        return CNPJValido;
    }
}