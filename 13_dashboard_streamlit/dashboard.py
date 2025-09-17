import streamlit as st 
from connect_data_warehouse import query_job_listings


def layout():
    df = query_job_listings()
    st.title("Data engineering job ads")
    st.write("This dashboard shows technical field job ads from arbetsförmedlingens API.")
    st.markdown("## Vacancies")
    tabs = st.columns(3)
    
    with tabs[0]:
        st.metric(label="Total", value=df["VACANCIES"].sum())
        
    with tabs[1]:
        st.metric(label="Laboratorieingenjörer", value=df.query("OCCUPATION_GROUP == 'Laboratorieingenjörer'")["VACANCIES"].sum(),)    
        
    with tabs[2]:
        st.metric(label="Övriga ingenjörer och tekniker",value=df.query("OCCUPATION_GROUP == 'Övriga ingenjörer och tekniker'")["VACANCIES"].sum(),)    
        
    st.markdown("## Job listings data")    
    st.dataframe(df)
    
    
if __name__ == "__main__":
    layout()    