# whoami
Olá, meu nome é Anderson e esse é um projeto de testes de exemplo, usando ruby com as Gems: capybara, httparty, rspec, rubocop, selenium-webdriver, site_prism
Para saber mais sobre mim, acesse meu linkedin: https://www.linkedin.com/in/andersonvasconcelossantana/?locale=en_US

##  Automação de testes funcionais
Neste exemplo, preferi utilizar Rspec ao invés de Cucumber, por que acho que o BDD entregue pelo Rspec é muito mais simples de construir/manter do que o BDD com Linguagem Gherkin que o Cucumber utiliza.

Segue exemplo do report de execução do projeto:
![Rspec-exec](report.png?raw=true "Report")
### Pré-Requisitos
* Ruby 2.5.1 ou Docker e docker-compose

### Antes de Rodar
instale as gems: `gem install bundler` e `bundle install`

**avalie a utilização de boas práticas no código: `bundle exec rubocop`**

criar seu arquivo `.env`, caso queira usar o padrão: `cp .env-example .env`

### Executando
Sem docker: `rspec`

Com docker: `docker-compose run app`
