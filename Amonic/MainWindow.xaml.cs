using Amonic.DataSet1TableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Amonic
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        UsersTableAdapter usersTableAdapter = new UsersTableAdapter();
        DataSet1 ds = new DataSet1();
        public MainWindow()
        {
            ds = new DataSet1();
            InitializeComponent();
            usersTableAdapter = new UsersTableAdapter();
            usersTableAdapter.Fill(ds.Users);
        }

        private void loginbtn_Click(object sender, RoutedEventArgs e)
        {
            if (!usernametb.Equals(""))
            {
                if (!passwordtb.Equals(""))
                {
                    for (int i=0;i<ds.Users.Rows.Count;i++)
                    {
                        if (ds.Users[2][i].ToString()==usernametb.Text)
                        {
                            if (ds.Users[3][i].ToString() == passwordtb.Password)
                            {
                                main m = new main();
                                m.Show();
                                this.Hide();
                            }
                        }
                    }
                }
            }
        }
    }
}
