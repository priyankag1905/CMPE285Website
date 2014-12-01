using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CMPE285Website.Startup))]
namespace CMPE285Website
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
