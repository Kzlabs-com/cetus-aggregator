#[allow(unused_field)]
module vsui::validator_set;

use sui::object::UID;
use sui::object_table::ObjectTable;
use sui::table::Table;
use sui::vec_map::VecMap;
use sui_system::staking_pool::StakedSui;

public struct Vault has store {
    stakes: ObjectTable<u64, StakedSui>,
    gap: u64,
    length: u64,
    total_staked: u64,
}

public struct ValidatorSet has key, store {
    id: UID,
    vaults: Table<address, Vault>,
    validators: VecMap<address, u64>,
    sorted_validators: vector<address>,
    is_sorted: bool,
}
