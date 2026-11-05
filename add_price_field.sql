-- Adds optional per-copy asking prices to Bin Stock Tracker inventory.
-- Existing records are preserved. Existing asking_price values remain usable as
-- the same price for each copy until you set individual prices in the app.
ALTER TABLE public.bin_inventory
  ADD COLUMN IF NOT EXISTS asking_price numeric(10,2) CHECK (asking_price IS NULL OR asking_price >= 0),
  ADD COLUMN IF NOT EXISTS copy_prices numeric(10,2)[];

NOTIFY pgrst, 'reload schema';
