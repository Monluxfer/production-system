using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace dota2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        public static HashSet<string> Forward(HashSet<string> start_facts, List<Rule> rules, ref TextBox textBox, string fin)
        {
            for (int i = 0; i < 4; i++)
            {
                foreach (var rule in rules)
                {
                    var needed_facts = new HashSet<string>(rule.left);
                    var new_facts = needed_facts.Except(start_facts);

                    if (new_facts.Count() <= 0 && !start_facts.Contains(rule.right))
                    {
                        string facts = "";
                        foreach (var fact in rule.left)
                        {
                            facts = facts + fact + " ";
                        }

                        start_facts.Add(rule.right);
                        textBox.AppendText(String.Format("{0} -> {1}", facts, rule.right) + System.Environment.NewLine);
                        if (rule.right == fin)
                        {
                            textBox.AppendText("Искомый персонаж найден");
                            return start_facts;
                        }
                    }
                }
            }
            textBox.AppendText("Искомый персонаж не найден");
            return start_facts;
        }

        public class CustomTreeNode
        {
            public String Label { get; set; }
            public List<CustomTreeNode> Children { get; set; }
        }

        public static HashSet<string> Backward(string start_fact, List<Rule> rules, ref TextBox textBox, string fin)
        {
            HashSet<string> facts = new HashSet<string>();
            facts.Add(fin);
            HashSet<string> timed_facts = new HashSet<string>();

            for (int i = 0; i < 4; i++)
            {
                foreach (var rule in rules)
                {
                    foreach (var fact in facts)
                    {
                        if (fact == rule.right)
                        {
                            foreach (var item in rule.left)
                            {
                                timed_facts.Add(item);
                            }
                        }
                    }

                    foreach (var fact in timed_facts)
                    {
                        facts.Add(fact);
                    }
                    timed_facts = new HashSet<string>();
                }
            }

            if (facts.Contains(start_fact))
            {
                HashSet<string> start_facts = new HashSet<string>() { start_fact };
                bool is_there_fact = false;
                for (int i = 0; i < 4; i++)
                {
                    foreach (var rule in rules)
                    {
                        var needed_facts = new HashSet<string>(rule.left);
                        var new_facts = needed_facts.Except(start_facts);

                        if (new_facts.Count() <= 0 && !start_facts.Contains(rule.right))
                        {
                            string n_facts = "";
                            foreach (var fact in rule.left)
                            {
                                n_facts = n_facts + fact + " ";
                            }

                            start_facts.Add(rule.right);
                            if (rule.right == fin)
                            {
                                is_there_fact = true;
                            }
                        }
                    }
                }
                if (is_there_fact)
                {
                    Forward(new HashSet<string>() { start_fact }, rules, ref textBox, fin);
                }
                else
                {
                    textBox.AppendText("Искомый персонаж не найден" + System.Environment.NewLine);
                }

            }
            else
            {
                textBox.AppendText("Искомый персонаж не найден" + System.Environment.NewLine);
            }    

            return facts;
        }

        public List<Rule> return_rules()
        {
            List<Rule> rules = new List<Rule>();

            string line;
            System.IO.StreamReader file = new System.IO.StreamReader("rules.txt");
            char[] separators = { ',', '-' };
            int ind = 0;

            while ((line = file.ReadLine()) != null)
            {
                if (line == "")
                    continue;
                var string_array = line.Split(separators, StringSplitOptions.RemoveEmptyEntries);

                Rule rule = new Rule();
                rules.Add(rule);
                for (int i = 0; i < string_array.Length - 1; i++)
                {
                    rules[ind].left.Add(string_array[i]);
                }

                rules[ind].right = string_array[string_array.Length - 1];
                ind++;
            }
            file.Close();

            return rules;
        }

        public List<string> return_team()
        {
            string line;
            List<string> team = new List<string>();
            System.IO.StreamReader file = new System.IO.StreamReader("team.txt");

            while ((line = file.ReadLine()) != null)
            {
                if (line == "")
                    continue;

                team.Add(line);
            }

            file.Close();

            return team;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            var start_facts = new HashSet<string>();
            var rules = return_rules();

            foreach (object itemChecked in checkedListBox1.CheckedItems)
                start_facts.Add(itemChecked.ToString());

            if (start_facts.Count == 5)
            {
                var fin_facts = Forward(start_facts, rules, ref textBox1, checkedListBox2.CheckedItems[0].ToString());
            }
            else
            {
                textBox1.AppendText("В команде соперника должно быть 5 персонажей" + System.Environment.NewLine);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var rules = return_rules();

            var fin_facts = Backward(checkedListBox1.CheckedItems[0].ToString(), rules, ref textBox1, checkedListBox2.CheckedItems[0].ToString());
        }
    }

    public class Rule
    {
        public List<string> left;
        public string right;

        public Rule()
        {
            left = new List<string>();
            right = "";
        }

    }
}
