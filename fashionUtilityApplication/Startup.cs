using Microsoft.Owin;
using Owin;
using Stripe;

[assembly: OwinStartupAttribute(typeof(fashionUtilityApplication.Startup))]
namespace fashionUtilityApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            System.Console.WriteLine(System.Configuration.ConfigurationManager.AppSettings["emailServiceUserName"]);
            StripeConfiguration.ApiKey = System.Configuration.ConfigurationManager.AppSettings["stripeSecretKey"];
        }
    }
}
