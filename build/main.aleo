import credits.aleo;
import multi_token_support_program_v1.aleo;
program mautjee_token.aleo;


struct TokenMetadata:
    token_id as field;
    name as u128;
    symbol as u128;
    decimals as u8;
    supply as u128;
    max_supply as u128;
    admin as address;
    external_authorization_required as boolean;
    external_authorization_party as address;

struct TokenOwner:
    account as address;
    token_id as field;




function initialize:
    assert.eq self.caller aleo1yd2w7kc8wtq632ashmt6t0trk5qk8xazm3lnpm3rsra90qmdlqqsqqsmp0;
    call multi_token_support_program_v1.aleo/register_token 4206907042field 7797117116106101101u128 776585u128 6u8 1_000_000_000_000_000u128 false mautjee_token.aleo into r0;
    call multi_token_support_program_v1.aleo/mint_public 44206907042field aleo1yd2w7kc8wtq632ashmt6t0trk5qk8xazm3lnpm3rsra90qmdlqqsqqsmp0 1_000_000_000_000_000u128 4_294_967_295u32 into r1;
    async initialize r0 r1 into r2;
    output r2 as mautjee_token.aleo/initialize.future;

finalize initialize:
    input r0 as multi_token_support_program_v1.aleo/register_token.future;
    input r1 as multi_token_support_program_v1.aleo/mint_public.future;
    await r0;
    await r1;

