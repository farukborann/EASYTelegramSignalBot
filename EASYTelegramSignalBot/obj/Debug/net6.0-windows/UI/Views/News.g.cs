﻿#pragma checksum "..\..\..\..\..\UI\Views\News.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "7EDF9A89FD48D3705DE63B17251636E79E295BF4"
//------------------------------------------------------------------------------
// <auto-generated>
//     Bu kod araç tarafından oluşturuldu.
//     Çalışma Zamanı Sürümü:4.0.30319.42000
//
//     Bu dosyada yapılacak değişiklikler yanlış davranışa neden olabilir ve
//     kod yeniden oluşturulursa kaybolur.
// </auto-generated>
//------------------------------------------------------------------------------

using EASYTelegramSignalBot.ViewModels;
using LiveCharts.Wpf;
using MahApps.Metro;
using MahApps.Metro.Accessibility;
using MahApps.Metro.Actions;
using MahApps.Metro.Automation.Peers;
using MahApps.Metro.Behaviors;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using MahApps.Metro.Converters;
using MahApps.Metro.Markup;
using MahApps.Metro.Theming;
using MahApps.Metro.ValueBoxes;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace EASYTelegramSignalBot.UI.Views {
    
    
    /// <summary>
    /// News
    /// </summary>
    public partial class News : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 39 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox LongSignalMessageTextBox;
        
        #line default
        #line hidden
        
        
        #line 42 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox ShortSignalMessageTextBox;
        
        #line default
        #line hidden
        
        
        #line 74 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal MahApps.Metro.Controls.NumericUpDown RSIPeriotNumeric;
        
        #line default
        #line hidden
        
        
        #line 76 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button SaveSettingsButton;
        
        #line default
        #line hidden
        
        
        #line 108 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox AddGroupTextBox;
        
        #line default
        #line hidden
        
        
        #line 114 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox AddUserTextBox;
        
        #line default
        #line hidden
        
        
        #line 116 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal MahApps.Metro.Controls.NumericUpDown AddUserSymbolDaysTextBox;
        
        #line default
        #line hidden
        
        
        #line 120 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button AddUserButton;
        
        #line default
        #line hidden
        
        
        #line 124 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView UsersListView;
        
        #line default
        #line hidden
        
        
        #line 138 "..\..\..\..\..\UI\Views\News.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button DelUserButton;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.10.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/EASYTelegramSignalBot;component/ui/views/news.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\..\UI\Views\News.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.10.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.LongSignalMessageTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.ShortSignalMessageTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.RSIPeriotNumeric = ((MahApps.Metro.Controls.NumericUpDown)(target));
            return;
            case 4:
            this.SaveSettingsButton = ((System.Windows.Controls.Button)(target));
            return;
            case 5:
            this.AddGroupTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.AddUserTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.AddUserSymbolDaysTextBox = ((MahApps.Metro.Controls.NumericUpDown)(target));
            return;
            case 8:
            this.AddUserButton = ((System.Windows.Controls.Button)(target));
            return;
            case 9:
            this.UsersListView = ((System.Windows.Controls.ListView)(target));
            return;
            case 10:
            this.DelUserButton = ((System.Windows.Controls.Button)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

