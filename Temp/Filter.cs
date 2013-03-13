using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

namespace DataFilterDemo
{
    /// <summary>
    /// Summary description for Filter
    /// </summary>
    [Serializable]
    public class Filter
    {
        string prefix;
        public string Prefix
        {
            get { return prefix; }
            set { prefix = value; }
        }
        string operation;
        public string Operation
        {
            get { return operation; }
            set { operation = value; }
        }

        string columnName;
        public string ColumnName
        {
            get { return columnName; }
            set { columnName = value; }
        }

        string columnValue;
        public string ColumnValue
        {
            get { return columnValue; }
            set { columnValue = value; }
        }

        public Filter()
        {
            this.prefix = "";
            this.columnName = "";
            this.operation = "";
            this.columnValue = "";
        }
        public Filter(string columnName, string operation, string columnValue)
        {
            this.prefix = "";
            this.columnName = columnName;
            this.operation = operation;
            this.columnValue = columnValue;

        }

        public Filter(string prefix, string columnName, string operation, string columnValue)
        {
            this.prefix = prefix;
            this.columnName = columnName;
            this.operation = operation;
            this.columnValue = columnValue;

        }

        public override string ToString()
        {
            return prefix + " ( " + columnName + " " + operation + " " + columnValue + " ) ";
        }

        public string GetFilter()
        {
            string[] columnValues = this.columnValue.Split(';');
            string columnValue = "";
            if (columnValues.Length > 1)
            {
                for (int ii = 0; ii < columnValues.Length; ii++)
                {
                    Regex r = new Regex("^([0]?[1-9]|[1|2][0-9]|[3][0|1])[/]([0]?[1-9]|[1][0-2])[/]([0-9]{4}|[0-9]{2})$");
                    string dynValue = columnValues[ii].Replace(" ", "");
                    if (dynValue[0] == '{' && dynValue.Trim()[dynValue.Length - 1] == '}')
                    {

                        dynValue = dynValue.Remove(0, 1);
                        dynValue = dynValue.Remove(dynValue.Length - 1, 1);
                        dynValue = dynValue.Replace("+", " + ");
                        dynValue = dynValue.Replace("-", " - ");

                        string[] dynValues = dynValue.Split(' ');
                        if (dynValues.Length == 3)
                        {
                            switch (dynValues[0])
                            {
                                case "t":
                                    switch (dynValues[2][0].ToString())
                                    {
                                        case "d":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddDays(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 2)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddDays((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                            }
                                            break;
                                        case "m":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddMonths(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddMonths((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                            }
                                            break;
                                        case "y":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddYears(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;

                                                }

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddYears((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                            }
                                            break;
                                    }
                                    break;
                                case "y":
                                    switch (dynValues[2][0].ToString())
                                    {
                                        case "d":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddDays(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddDays((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                            }
                                            break;
                                        case "m":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddMonths(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddMonths((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                            }
                                            break;
                                        case "y":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddYears(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddYears((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                if (ii == 0)
                                                {
                                                    columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                                else if (ii == columnValues.Length - 1)
                                                {
                                                    columnValue += " #" + dv.ToString() + "# ";
                                                }
                                                else
                                                {
                                                    columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                                }
                                            }
                                            break;
                                    }
                                    break;
                            }
                        }
                        else if (dynValues.Length == 1)
                        {
                            switch (dynValues[0])
                            {
                                case "t":

                                    if (ii == 0)
                                    {
                                        columnValue += "#" + DateTime.Today.ToString() + "# OR " + columnName + " " + operation;
                                    }
                                    else if (ii == columnValues.Length - 1)
                                    {
                                        columnValue += " #" + DateTime.Today.ToString() + "# ";
                                    }
                                    else
                                    {
                                        columnValue += " #" + DateTime.Today.ToString() + "# OR " + columnName + " " + operation;
                                    }
                                    break;

                                case "y":
                                    DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);

                                    if (ii == 0)
                                    {
                                        columnValue += "#" + dv.ToString() + "# OR " + columnName + " " + operation;
                                    }
                                    else if (ii == columnValues.Length - 1)
                                    {
                                        columnValue += " #" + dv.ToString() + "# ";
                                    }
                                    else
                                    {
                                        columnValue += " #" + dv.ToString() + "# OR " + columnName + " " + operation;
                                    }

                                    break;
                            }
                        }
                    }
                    else if (r.IsMatch(columnValues[ii].Trim()))
                    {
                        DateTime dt = new DateTime();
                        string day = columnValues[ii].Trim().Split(new char[] { '/' })[0].ToString();
                        string month = columnValues[ii].Trim().Split(new char[] { '/' })[1].ToString();
                        string year = columnValues[ii].Trim().Split(new char[] { '/' })[2].ToString();

                        string ds = month + "/" + day + "/" + year;


                        dt = DateTime.Parse(ds);
                        if (ii == 0)
                        {
                            columnValue += "#" + dt.ToString() + "# OR " + columnName + " " + operation;
                        }
                        else if (ii == columnValues.Length - 1)
                        {
                            columnValue += " #" + dt.ToString() + "# ";
                        }
                        else
                        {
                            columnValue += " #" + dt.ToString() + "# OR " + columnName + " " + operation;
                        }
                    }
                    else
                    {
                        if (ii == 0)
                        {
                            if (operation != "LIKE" && operation != "NOT LIKE")

                                columnValue += "'" + columnValues[ii].Trim() + "' OR " + columnName + " " + operation;
                            else
                                columnValue += "'%" + columnValues[ii].Trim() + "%' OR " + columnName + " " + operation;
                        }
                        else if (ii == columnValues.Length - 1)
                        {
                            if (operation != "LIKE" && operation != "NOT LIKE")

                                columnValue += " '" + columnValues[ii].Trim() + "' ";
                            else
                                columnValue += " '%" + columnValues[ii].Trim() + "%' ";
                        }
                        else
                        {
                            if (operation != "LIKE" && operation != "NOT LIKE")

                                columnValue += "'" + columnValues[ii].Trim() + "' OR " + columnName + " " + operation;
                            else
                                columnValue += "'%" + columnValues[ii].Trim() + "%' OR " + columnName + " " + operation;
                        }

                    }

                }

                return prefix + " ( " + columnName + " " + operation + " " + columnValue + " ) ";

            }
            else
            {
                for (int ii = 0; ii < columnValues.Length; ii++)
                {
                    Regex r = new Regex("^([0]?[1-9]|[1|2][0-9]|[3][0|1])[/]([0]?[1-9]|[1][0-2])[/]([0-9]{4}|[0-9]{2})$");

                    string dynValue = columnValues[ii].Replace(" ", "");
                    if (dynValue[0] == '{' && dynValue.Trim()[dynValue.Length - 1] == '}')
                    {

                        dynValue = dynValue.Remove(0, 1);
                        dynValue = dynValue.Remove(dynValue.Length - 1, 1);
                        dynValue = dynValue.Replace("+", " + ");
                        dynValue = dynValue.Replace("-", " - ");

                        string[] dynValues = dynValue.Split(' ');
                        if (dynValues.Length == 3)
                        {
                            switch (dynValues[0])
                            {
                                case "t":
                                    switch (dynValues[2][0].ToString())
                                    {
                                        case "d":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddDays(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddDays((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";
                                            }
                                            break;
                                        case "m":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddMonths(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddMonths((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";
                                            }
                                            break;
                                        case "y":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddYears(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = DateTime.Parse(DateTime.Today.ToShortDateString()).AddYears((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";
                                            }
                                            break;
                                    }
                                    break;
                                case "y":
                                    switch (dynValues[2][0].ToString())
                                    {
                                        case "d":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddDays(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddDays((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";
                                            }
                                            break;
                                        case "m":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddMonths(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddMonths((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";
                                            }
                                            break;
                                        case "y":
                                            if (dynValues[1] == "+")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddYears(Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            else if (dynValues[1] == "-")
                                            {
                                                DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                                dv = dv.AddYears((-1) * Int32.Parse(dynValues[2].Substring(2, dynValues[2].Length - 3)));
                                                columnValue = " #" + dv.ToString() + "# ";

                                            }
                                            break;
                                    }
                                    break;
                            }
                        }
                        else if (dynValues.Length == 1)
                        {
                            switch (dynValues[0])
                            {
                                case "t":

                                    columnValue = " #" + DateTime.Today.ToShortDateString() + "# ";
                                    break;
                                case "y":
                                    DateTime dv = new DateTime(DateTime.Today.Year, 1, 1);
                                    columnValue = " #" + dv.ToString() + "# ";
                                    break;
                            }
                        }
                    }

                    else if (r.IsMatch(columnValues[ii].Trim()))
                    {
                        DateTime dt = new DateTime();
                        string day = columnValues[ii].Trim().Split(new char[] { '/' })[0].ToString();
                        string month = columnValues[ii].Trim().Split(new char[] { '/' })[1].ToString();
                        string year = columnValues[ii].Trim().Split(new char[] { '/' })[2].ToString();

                        string ds = month + "/" + day + "/" + year;


                        dt = DateTime.Parse(ds);
                        columnValue = "#" + dt.ToString() + "#";
                    }
                    else
                    {
                        if (operation != "LIKE" && operation != "NOT LIKE")//LIKE (FALSE,TRUE)-- <> (TRUE,TRUE)

                            columnValue = "'" + columnValues[ii].Trim() + "'";
                        else
                            columnValue = "'%" + columnValues[ii].Trim() + "%'";
                    }

                }
                return prefix + " ( " + columnName + " " + operation + " " + columnValue + " ) ";
            }
        }
    }
}