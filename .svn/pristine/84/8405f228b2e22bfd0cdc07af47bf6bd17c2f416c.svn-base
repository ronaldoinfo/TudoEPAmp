using System;
using System.Configuration;

namespace CMS.Web.FrontEnd.TemplatesV55
{
    public partial class _Default : System.Web.UI.Page
    {
        public string editoria { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            editoria = "home";
            this.Page.Title = this.Page.Title + " - " + ConfigurationManager.AppSettings["SiteSlogan"].ToString();
            this.Page.MetaDescription = "tudoep, plataforma de conteúdo e notícias que vai falar sobre tudo. Um espaço para fãs de temas variados com acesso a todo tido de conteúdo e nos mais diferentes formatos, confira tudo sobre games, agronegócio, decoração, corrida, saúde, viagens, veículos e automobilismo, tecnologia, o que acontece no Brasil e no mundo e muito mais.";
            this.Page.MetaKeywords = "tudo ep, tudoep, portal, portal de notícias, site, jornalismo, não a fakenews, fatos, artigos, notícias, esporte, futebol, esportes olímpicos, copa do mundo, política, eleição, eleição 2022, eleições 2022, gastronomia, cozinha, receita, churrasco, games, game, game play, jogos, autos, automóveis, carros, automobilismo, motos, motovelocidade, corrida, on run, corrida de rua, agro, agronegócio, agricultura, viagens, turismo, passaporte, hotéis, hotelaria, bebês, gravidez, nascimento, maternidade, mãe, filho, decor, decoração, arquitetura, design de interiores, faça você mesmo, cupons, compras, economia, descontos, desconto, vagas, vaga de emprego, emprego, empregos, classificados, concurso, currículo, saúde, moda, cotidiano, brasil e mundo, colunistas, opinião, análise, jornal, revistas, novelas, tv, televisão, filmes, cinema, fotos, imagem, som, podcast, tecnologia, vestibular, acidade on, cbn, rádio";
            masterpages_Template_Home_AMP master = this.Master as masterpages_Template_Home_AMP;
            master.Editoria = editoria;
            master.IndexarNoGoogle = true;

			if (this.ucHome != null)
            {
                this.ucHome.editoria = editoria;
            }
        }
    }
}