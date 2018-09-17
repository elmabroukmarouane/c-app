<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(TpersonnesTableSeeder::class);
        $this->call(StatuscomptesTableSeeder::class);
        $this->call(PersonnesTableSeeder::class);
        $this->call(MembresTableSeeder::class);
        $this->call(UsersTableSeeder::class);
        $this->call(UserlogsTableSeeder::class);
        $this->call(Niveau1sTableSeeder::class);
        $this->call(Niveau2sTableSeeder::class);
        $this->call(RankingsTableSeeder::class);
        $this->call(AbonnementsTableSeeder::class);
        $this->call(OntradingsTableSeeder::class);
        $this->call(PostsTableSeeder::class);
        $this->call(MessagesTableSeeder::class);
        $this->call(BanksTableSeeder::class);
        $this->call(CurrenciesTableSeeder::class);
        $this->call(BankaccountsTableSeeder::class);
        $this->call(CompanyaccountsTableSeeder::class);
        $this->call(BankwalletsTableSeeder::class);
        $this->call(CompanywalletsTableSeeder::class);
        $this->call(SupportticketsTableSeeder::class);
        $this->call(SupportticketmessagesTableSeeder::class);
        $this->call(QuestionsTableSeeder::class);
        $this->call(QuestrepsTableSeeder::class);
        $this->call(PackabonnementplatformsTableSeeder::class);
        $this->call(AbonnementplatformsTableSeeder::class);
        $this->call(BalanceaffiliationparametersTableSeeder::class);
    }
}
