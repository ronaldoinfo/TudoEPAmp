using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;
using System.Web;

public partial class gerador_Default : System.Web.UI.Page
{
    protected void Button1_Click(object sender, EventArgs e)
    {
        // 1-) copiar todos os arquivos da pasta base para a pasta saida
        CopyFilesRecursively(MapPath("~/gerador/base"), MapPath("~/gerador/saida"));

        // 2-) renomear todos os arquivos com o nome da editoria

        // 3-) find e replace nas variáveis secaoBase e editoriaBase
        ltlResultado.Text += " Arquivos gerados com sucesso!";
    }

    private void CopyFilesRecursively(string sourcePath, string targetPath)
    {
        // Apaga todos arquivos
        Directory.Delete(targetPath, true);

        //cria os diretórios
        foreach (string dirPath in Directory.GetDirectories(sourcePath, "*", SearchOption.AllDirectories))
        {
            Directory.CreateDirectory(dirPath.Replace(sourcePath, targetPath));
        }

        foreach (string newPath in Directory.GetFiles(sourcePath, "*.*", SearchOption.AllDirectories))
        {
            // copia os arquivos e diretórios
            File.Copy(newPath, newPath.Replace(sourcePath, targetPath).Replace("editoriaBase",txtNomeEditoria.Text), true);

            // Replace nome da editoria
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "editoriaBase", txtNomeEditoria.Text);

            // Replace idsecao
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "secaoBase", txtIdSecao.Text);

            // Replace Title
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "tituloBase", txtTitulo.Text);

            // Replace MetaDescription
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "metaDescBase", txtMetaDescription.Text);

            // Replace MetaKeywords
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "metaKeyBase", txtMetaKeywords.Text);

            // Replace Quantidade registros nas listas
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "quantidadeBase", txtQuantidadeRegistros.Text);

            // Replace id site
            ReplaceInFile(newPath.Replace(sourcePath, targetPath).Replace("editoriaBase", txtNomeEditoria.Text), "siteBase", txtSite.Text);
        }
    }

    private void ReplaceInFile(string filePath, string searchText, string replaceText)
    {
        StreamReader reader = new StreamReader(filePath);
        string content = reader.ReadToEnd();
        reader.Close();
        content = Regex.Replace(content, searchText, replaceText);
        StreamWriter writer = new StreamWriter(filePath);
        writer.Write(content);
        writer.Close();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtLogin.Text == "admin" && txtSenha.Text == "186007#cms")
        {
            HttpCookie cookie = new HttpCookie("internaGenerator");
            cookie.Values.Add("login", txtLogin.Text);
            cookie.Values.Add("senha", txtSenha.Text);
            cookie.Expires = DateTime.Now.AddMinutes(30);
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
        else
        {
            ltlMensagemLogin.Text = "Login e senha incorretos!";
        }
    }
}