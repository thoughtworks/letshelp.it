# coding: utf-8

require File.expand_path(File.dirname(__FILE__) + "/../test_helper")

class OrganizationTest < ActiveSupport::TestCase

  should have_and_belong_to_many :tags

  should validate_presence_of :name
  should validate_presence_of :contact
  should validate_presence_of :city
  should validate_presence_of :country
  should validate_presence_of :password
  should validate_presence_of :email
  should validate_presence_of :announcer

  should validate_uniqueness_of :name

  should_not allow_value("invalidmail").for(:email)
  should_not allow_value("@b.com").for(:email)
  should allow_value("a@b.com").for(:email)
  should allow_value("valid.string+alias@mail.com").for(:email)

  should "slug organization name" do
    assert_equal 'nacao-da-vo-lurdes', Organization.slug_name('Nação da Vó Lurdes')
    assert_equal 'santa-casa-de-misericordia-de-sao-paulo', Organization.slug_name('Santa Casa de Misericórdia de São Paulo')
  end

  should "slug city name" do
    assert_equal 'jaragua do sul', Organization.slug_city('Jaraguá do Sul')
    assert_equal 'sao paulo', Organization.slug_city('São Paulo')
  end

  should "create slug city automatically" do
    org = organizations(:wwf)

    org.city = 'Jaraguá do Sul'
    assert_equal 'jaragua do sul', org.city_slug
    assert org.save

    org.city = 'São Paulo'
    assert_equal 'sao paulo', org.city_slug
    assert org.save
  end

  should "create slug name with approximated ascii characters" do
    params = { :name => 'Minha organização', :contact => 'test@test.com', :city => 'Porto Alegre', :city_slug => 'porto alegre',
      :country => 'Brazil', :needs => 'mucha cosa', :password => '1', :email => 'test@test.com', :announcer => 'announcer'}
    org = Organization.create(params)
    assert_equal "minha-organizacao", org.name_slug, "name slug is '#{org.name_slug}', but 'minha-organizacao' was expected"
  end

  should "retrieve at most the parameter informed of organizations" do
    orgs = Organization.get_random_list(2)
    assert_operator orgs.count, :<=, 2

    orgs = Organization.get_random_list(3)
    assert_operator orgs.count, :<=, 3

    orgs = Organization.get_random_list(1)
    assert_operator orgs.count, :<=, 1

    orgs = Organization.get_random_list(6)
    assert_operator orgs.count, :<=, 6
  end

end

