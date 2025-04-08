<!-- src/routes/+page.svelte -->
<script>
  import Header from '$lib/components/Header.svelte';
  import WatchSection from '$lib/components/WatchSection.svelte';
  import FollowSection from '$lib/components/FollowSection.svelte';
  import SupportSection from '$lib/components/SupportSection.svelte';
  import ContactSection from '$lib/components/ContactSection.svelte';
  import Footer from '$lib/components/Footer.svelte';
</script>

<svelte:head>
  <title>Fred's Shed NZ - Workshop antics, cars, tools, and adventure!</title>
  <meta name="description" content="Fabrication, woodworking, cars, tools, boats, off grid, and adventure. In the shed or exploring NZ!">
</svelte:head>

<Header />

<!-- Add an empty div with a specific height to create space -->
<div style="height: 20px;"></div>

<main>
  <!-- Hero Section -->
  <section class="py-16 bg-background">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="bg-white rounded-lg shadow-lg overflow-hidden p-8">
        <!-- Centered image -->
        <div class="flex justify-center mb-8">
          <img 
            src="/images/FredsShedNZ.png" 
            alt="Fred's Shed NZ" 
            class="w-64 h-64 object-contain"
          />
        </div>
        
        <!-- Tagline below -->
        <p class="text-xl text-primary-light text-center">
          Fabrication, woodworking, cars, tools, boats, off grid, and adventure. In the shed or exploring NZ!
        </p>
      </div>
    </div>
  </section>
  
  <WatchSection />
  <FollowSection />
  <SupportSection />
  <ContactSection />
</main>

<Footer />
