using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Apenas para distinguir o tipo de excecao que pode ser lançada ao front end
/// </summary>
public class BusinessException : SystemException
{
    public BusinessException(string Mensagem)
        : base(Mensagem)
    { }
}