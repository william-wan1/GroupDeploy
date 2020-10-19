using Microsoft.Owin;
using Owin;
using Stripe;

[assembly: OwinStartupAttribute(typeof(fashionUtilityApplication.Startup))]
namespace fashionUtilityApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            StripeConfiguration.ApiKey = System.Configuration.ConfigurationManager.AppSettings["stripeSecretKey"];
        }
    }
}
