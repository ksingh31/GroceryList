using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GroceryListSolution.Startup))]
namespace GroceryListSolution
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
