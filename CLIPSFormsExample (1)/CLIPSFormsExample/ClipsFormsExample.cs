using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;

using CLIPSNET;


namespace ClipsFormsExample
{
    public partial class ClipsFormsExample : Form
    {
        private CLIPSNET.Environment clips = new CLIPSNET.Environment();
        
        /// <summary>
        /// Распознавалка
        /// </summary>
        public ClipsFormsExample()
        {
            InitializeComponent();
        }

        private void NewRecognPhrases(List<string> phrases)
        {

        }

        private void Recogn_SpeechRecognized(object sender, Microsoft.Speech.Recognition.SpeechRecognizedEventArgs e)
        {
            clips.Run();
            HandleResponse();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        private void HandleResponse()
        {
            //  Вытаскиаваем факт из ЭС
            String evalStr = "(find-fact ((?f ioproxy)) TRUE)";
            FactAddressValue fv = (FactAddressValue)((MultifieldValue)clips.Eval(evalStr))[0];

            MultifieldValue damf = (MultifieldValue)fv["messages"];
            MultifieldValue vamf = (MultifieldValue)fv["answers"];
            
            outputBox.Text += "Новая итерация : " + System.Environment.NewLine;
            for (int i = 0; i < damf.Count; i++)
            {
                LexemeValue da = (LexemeValue)damf[i];
                byte[] bytes = Encoding.Default.GetBytes(da.Value);

                string message = Encoding.UTF8.GetString(bytes);
                outputBox.Text += message + System.Environment.NewLine;

                string[] messages = message.Split();
                string fact = messages.Last().ToString();

                if (checkedListBox1.Items.Contains(fact))
                {
                    outputBox.Text += "для этой команды соперников контрпик найден" + System.Environment.NewLine;
                    nextButton.Enabled = false;
                    return;
                }
            }

            var phrases = new List<string>();
            if (vamf.Count > 0)
            {
                outputBox.Text += "----------------------------------------------------" + System.Environment.NewLine;
                for (int i = 0; i < vamf.Count; i++)
                {
                    //  Варианты !!!!!
                    LexemeValue va = (LexemeValue)vamf[i];
                    byte[] bytes = Encoding.Default.GetBytes(va.Value);
                    string message = Encoding.UTF8.GetString(bytes);
                    phrases.Add(message);
                    outputBox.Text += "Добавлен вариант для распознавания " + message + System.Environment.NewLine;
                }
            }
            
            if(vamf.Count == 0)
                clips.Eval("(assert (clearmessage))");
            else
                NewRecognPhrases(phrases);
        }

        private void nextBtn_Click(object sender, EventArgs e)
        {
            clips.Run();
            HandleResponse();
        }

        private void resetBtn_Click(object sender, EventArgs e)
        {
            nextButton.Enabled = true;
            outputBox.Text = "Выполнены команды Clear и Reset." + System.Environment.NewLine;
            //  Здесь сохранение в файл, и потом инициализация через него
            clips.Clear();

            //  Так тоже можно - без промежуточного вывода в файл
            clips.LoadFromString(codeBox.Text);

            clips.Reset();
        }

        private void openFile_Click(object sender, EventArgs e)
        {
            if (clipsOpenFileDialog.ShowDialog() == DialogResult.OK)
            {
                codeBox.Text = System.IO.File.ReadAllText(clipsOpenFileDialog.FileName);
            }
        }

        private void fontSelect_Click(object sender, EventArgs e)
        {
            if (fontDialog1.ShowDialog() == DialogResult.OK)
            {
                codeBox.Font = fontDialog1.Font;
                outputBox.Font = fontDialog1.Font;
            }
        }

        private void saveAsButton_Click(object sender, EventArgs e)
        {
            clipsSaveFileDialog.FileName = clipsOpenFileDialog.FileName;
            if (clipsSaveFileDialog.ShowDialog() == DialogResult.OK)
            {
                System.IO.File.WriteAllText(clipsSaveFileDialog.FileName, codeBox.Text);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var sbnew = new StringBuilder();
            string s = "\r\n(deffacts team \r\n";
            Random rand = new Random();
            foreach (var a in checkedListBox1.CheckedItems)
            {
                double num = GetRandomDouble(rand, -1, 1);
                s += "    (entity (name " + a.ToString() + ") (conf " + num.ToString(CultureInfo.InvariantCulture) + ") )\r\n";
            }
            s += ")";

            sbnew.Append(s);
            codeBox.Text += sbnew.ToString();
            clips.LoadFromString(codeBox.Text);
        }

        double GetRandomDouble(Random random, double min, double max)
        {
            return min + (random.NextDouble() * (max - min));
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }
    }
}
