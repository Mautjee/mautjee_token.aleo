import multi_token_support_program_v1.aleo;

// The 'mautjee_token' program.
program mautjee_token.aleo {
const ADMIN: address = aleo1yd2w7kc8wtq632ashmt6t0trk5qk8xazm3lnpm3rsra90qmdlqqsqqsmp0;


  struct TokenOwner {
    account: address,
    token_id: field
  }
  
  async transition initialize() -> Future {
    assert_eq(self.caller, ADMIN);
    let r0: Future = multi_token_support_program_v1.aleo/register_token(
      4206907042field, // token_id: field
      7797117116106101101u128, // name: u128, Mautjee ascii encoded
      776585u128, // symbol: u128, MAU ascii encoded
      6u8, // decimals: u8
      1_000_000_000_000_000u128, // max_supply: u128
      false, // external_authorization_required: boolean
      self.address // external_authorization_party: address
    );
    let r1: Future = multi_token_support_program_v1.aleo/mint_public(
      44206907042field, // token_id: field
      ADMIN,
      1_000_000_000_000_000u128,
      4_294_967_295u32
    );
    return initialize_future(r0, r1);
  }

  async function initialize_future(
    r0: Future,
    r1: Future
  ) {
    r0.await();
    r1.await();
  }
}
