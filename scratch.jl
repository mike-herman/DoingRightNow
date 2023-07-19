include(joinpath("src", "ATUSDownload.jl"))

df = download_atus_data("resp", 2021) |> 
    (x -> extract_dat_to_csv(x, "atusresp-2021.csv")) |>
    load_csv_to_dataframe

first(df,5)

mutable struct ATUSData
    df::DataFrame
    year::Int64
end

function ATUSData(year::Int64)
    resp = download_atus_data("resp", year) |> 
        (x -> extract_dat_to_csv(x, "atusresp-$(year).csv")) |>
        load_csv_to_dataframe
    act = download_atus_data("act", year) |>
        (x -> extract_dat_to_csv(x, "atusact-$(year).csv")) |>
        load_csv_to_dataframe
    cps = download_atus_data("cps", year) |>
        (x -> extract_dat_to_csv(x, "atuscps-$(year).csv")) |>
        load_csv_to_dataframe
    
    # clean activity df
    # clean cps df
    # clean resp df

    return ATUSData(df, year)
end