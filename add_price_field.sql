-- Adds an optional per-copy asking price to Bin Stock Tracker inventory.
-- Existing records are preserved and will show a blank price until edited.
ALTER TABLE public.bin_inventory
  ADD COLUMN IF NOT EXISTS asking_price numeric(10,2) CHECK (asking_price IS NULL OR asking_price >= 0);

NOTIFY pgrst, 'reload schema';
